<?php

namespace resutoran\backend\controllers;

use Yii;
use \yii\base\Exception;
use \yii\helpers\BaseInflector;

/**
 * ResuLocationController implements the CRUD actions for ResuLocation model.
 */
class ResuLocationNewProcessController extends ResuLocationController
{
    /**
     * @var string
     */
    //protected $model = null; // extends from ResuLocationCNTL's properties

    /**
     * @return string
     */
    public function actionCreate()
    {
        $model = new $this->model();

        if (Yii::$app->request->isPost === true) {

            $data =  Yii::$app->request->post();

            if ($model->load($data) && $model->save()) {

                // TODO use url module?
                return \Yii::$app->response->redirect('create-contact?id=' . $model->id);
            }
        }

        return $this->render('newLocation', [
            'model' => $model,
        ]);
    }

    /**
     * @param $id
     *
     * @return string
     */
    public function actionCreateContact($id)
    {
        $model = new \resutoran\common\models\ResuLocationContact();

        if (Yii::$app->request->isPost === true) {

            $data = Yii::$app->request->post();
            $data['ResuLocationContact']['resu_location_id'] = $id;

            if ($model->load($data) && $model->save()) {
                return \Yii::$app->response->redirect('create-option?id=' . $id);
            }
        }

        return $this->render('newContact', [
            'model' => $model,
        ]);
    }

    /**
     * @param $id
     *
     * @return string
     */
    public function actionCreateOption($id)
    {
        $model = new \resutoran\common\models\ResuLocationContact();

        if (Yii::$app->request->isPost === true) {

            $data = Yii::$app->request->post();
            $data['ResuLocationOption']['resu_location_id'] = $id;

            if ($model->load($data) && $model->save()) {
                return \Yii::$app->response->redirect('create-menu?id=' . $id);
            }
        }

        return $this->render('newContact', [
            'model' => $model,
        ]);
    }
    /**
     * @param $model
     * @param $optionMDLArray
     *
     * @return bool
     * @throws \yii\base\Exception
     */
    private function saveLocationOptions($model, $optionMDLArray)
    {
        $returnData = false;

        foreach ($optionMDLArray as $optionKeyMDL => $optionValueAttributes) {

            // does the option model class exists?s
            $optionMDL = '\resutoran\common\models\\' . BaseInflector::camelize( $optionKeyMDL );

            if (class_exists($optionMDL)) {

                foreach ($optionValueAttributes as $optionValueKey => $optionValueValue) {

                    // create a an AR
                    $optionMDL = new $optionMDL;

                    $optionMDL->setAttributes([
                        'resu_location_id'      => $model->id,
                        // todo This is terrible, refactor - DJE
                        str_replace('_location', '', $optionKeyMDL) . '_option_id'   => $optionValueValue
                    ]);

                    // save option AR to data store, or return error if present
                    if (!$optionMDL->validate() || !$optionMDL->save()) {
                        $returnData = $optionMDL->getErrors();
                    } else {
                        $returnData = true;
                    }
                }
            } else {
                throw new Exception('Unable to find related model for optional data.');
            }
        }

        return $returnData;
    }

    /**
     * @TODO this smells funny, can we factor this out to something like an event?
     *
     * @param $model
     * @param $optionMDLArray
     *
     * @return bool
     * @throws Exception
     */
    private function saveHoursValues($model, $data)
    {
        $returnData = false;

        foreach ($data as $key => $dayValue) {

            // save the hour value to the resu_hour_value
            $hourValueMDL = new \resutoran\common\models\ResuHourValue([
                'open' => $dayValue[0],
                'close' => $dayValue[1]
            ]);

            // save hour AR to data store, or return error if present
            if (!$hourValueMDL->save()) {
                $returnData = $hourValueMDL->getErrors();
            } else {

                $locationDay = new \resutoran\common\models\ResuLocationDay([
                    'resu_day_option_id'=> $key,
                    'resu_location_id'  => $model->id,
                    'resu_hour_value_id'=> $hourValueMDL->id
                ]);

                if (!$locationDay->save()) {
                    $returnData = $locationDay->getErrors();
                }
            }
        }

        return $returnData;
    }

    /**
     * @param $model \resutoran\common\models\ResuLocation
     * @param $data \array
     *
     * @return boolean
     */
    private function saveMenuAmountValues($model, $data)
    {
        $returnData = false;

        foreach ($data as $key => $menuAmountValue) {
            if (!empty($menuAmountValue['high_price']) && !empty($menuAmountValue['low_price'])) {
                $resuLocMenuMDL = new \resutoran\common\models\ResuLocationMenu([
                    'resu_location_id'    => $model->id,
                    'resu_menu_option_id' => $key,
                    'high_price'          => $menuAmountValue['high_price'] ?: null,
                    'low_price'           => $menuAmountValue['low_price'] ?: null,
                ]);

                if (!$resuLocMenuMDL->save()) {
                    $returnData = $resuLocMenuMDL->getErrors();
                } else {
                    $returnData = true;
                }
            } else {

            }
        }

        return $returnData;
    }

    /**
     * @param $model \resutoran\common\models\ResuLocation
     * @param $data \array
     *
     * @return boolean
     */
    private function saveBooleanOptionValues($model, $data)
    {
        $returnData = false;

        foreach ($data as $key => $value) {
            // TODO why is the view widget returning 1 for un-checked checkboxes?
            if ($value === '1') {
                continue;
            }

            $resuLocOptionMDL = new \resutoran\common\models\ResuLocationBoolean([
                'resu_location_id'      => $model->id,
                'resu_boolean_option_id'=> \resutoran\common\models\ResuBooleanOption::findOne([
                    'value' => $value
                ])->id
            ]);

            if (!$resuLocOptionMDL->save()) {
                $returnData = $resuLocOptionMDL->getErrors();
            } else {
                $returnData = true;
            }
        }

        return $returnData;
    }
}
