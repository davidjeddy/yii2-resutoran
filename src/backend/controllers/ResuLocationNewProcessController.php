<?php

namespace resutoran\backend\controllers;

use Yii;
use \yii\base\Exception;

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
                return \Yii::$app->response->redirect('add-additional-option?id=' . $model->id);
            }
        }

        return $this->render('create', [
            'model' => $model,
        ]);
    }

    /**
     * Updates an existing ResuAmbianceOption model.
     * If update is successful, the browser will be redirected to the 'view' page.
     * @param integer $id
     * @return mixed
     */
    public function actionUpdate($id)
    {
        $model = $this->findModel($id);

        if ($model->load(Yii::$app->request->post()) && $model->save()) {
            return \Yii::$app->response->redirect('add-additional-option?id=' . $model->id);
        } else {
            return $this->render('update', [
                'model' => $model,
            ]);
        }
    }

    // from here on the additional data points are stepped through alphabetically

    /**
     * @todo break this into two steps
     *
     * @param $id integer
     *
     * @return string
     */
    public function actionAddAdditionalOption($id)
    {
        $model = \resutoran\common\models\ResuLocation::findOne($id);

        if (Yii::$app->request->isPost === true) {

            $saveStatus  = $this->saveResuLocDressOption(
                $id,
                (\Yii::$app->request->post()['ResuLocation']['location_options']['resu_location_dress_code'] ?? null)
            );

            $saveStatus2 = $this->saveBooleanOptionValues(
                $id,
                (\Yii::$app->request->post()['ResuLocation']['resu_location_boolean'] ?? null)
            );

            if ($saveStatus === true && $saveStatus2 === true) {
                return \Yii::$app->response->redirect('add-contact?id=' . $id);
            }
        }

        return $this->render('addAdditionalOption', [
            'model' => $model,
        ]);
    }

    /**
     * @param $id
     *
     * @return string
     */
    public function actionAddContact($id)
    {
        $model = \resutoran\common\models\ResuLocationContact::findOne(['resu_location_id' => $id]);

        if (Yii::$app->request->isPost === true) {

            $data = Yii::$app->request->post();
            $data['ResuLocationContact']['resu_location_id'] = $id;

            if ($model->load($data) && $model->save()) {
                return \Yii::$app->response->redirect('add-hour?id=' . $id);
            }
        }

        return $this->render('addContact', [
            'model' => $model,
        ]);
    }

    /**
     * @param $id
     *
     * @return string
     */
    public function actionAddHour($id)
    {
        $model = \resutoran\common\models\ResuLocationHour::findAll(['resu_location_id' => $id]);

        if (Yii::$app->request->isPost === true) {

            $data = Yii::$app->request->post();
            $saveStatus = $this->saveHoursValues($id, $data);

            //if ($model->load($data) && $model->save()) {
            if ($saveStatus === true) {
                return \Yii::$app->response->redirect('add-menu?id=' . $id);
            }
        }

        return $this->render('addHour', [
            'model' => $model,
        ]);
    }

    /**
     * @param $id
     *
     * @return string
     */
    public function actionAddMenu($id)
    {
        $model = \resutoran\common\models\ResuLocationMenu::findAll(['resu_location_id' => $id]);

        if (Yii::$app->request->isPost === true) {

            $data = Yii::$app->request->post();
            $saveStatus = $this->saveMenuAmountValues($id, $data['ResuLocation']['resu_location_menu']);

            //if ($model->load($data) && $model->save()) {
            if ($saveStatus === true) {
                return \Yii::$app->response->redirect('add-option?id=' . $id);
            }
        }

        return $this->render('addMenu', [
            'model' => $model,
        ]);
    }

    /**
     * @param $id
     *
     * @return string
     */
    public function actionAddOption($id)
    {
        $model = $this->findModel($id);

        if (Yii::$app->request->isPost === true) {

            $data = Yii::$app->request->post();

            if ($model->load($data) && $model->save()) {
                return \Yii::$app->response->redirect('../resu-location');
            }
        }

        return $this->render('addOption', [
            'model' => $model,
        ]);
    }

    // private methods

    /**
     * @param $resuLocationId integer
     * @param $data array
     *
     * @return boolean
     */
    private function saveMenuAmountValues($resuLocationId, $data)
    {
        $returnData = false;

        foreach ($data as $key => $menuAmountValue) {
            // find record
            $resuLocMenuMDL = \resutoran\common\models\ResuLocationMenu::find()
                ->andWhere([
                    'resu_location_id'      => $resuLocationId,
                    'resu_menu_option_id'   => $key
                ])
                ->one();

            // or create AR
            if ($resuLocMenuMDL === null) {
                $resuLocMenuMDL = new \resutoran\common\models\ResuLocationMenu();
                $resuLocMenuMDL->setAttributes([
                    'resu_location_id'=> $menuAmountValue['high_price'] ?: null,
                    '' => $menuAmountValue['low_price'] ?: null,
                ]);
            }

            // populate values
            $resuLocMenuMDL->setAttributes([
                'high_price'=> $menuAmountValue['high_price'] ?: null,
                'low_price' => $menuAmountValue['low_price'] ?: null,
            ]);

            // save model
            if ($resuLocMenuMDL->save()) {
                $returnData = true;
            } else {
                $returnData = $resuLocMenuMDL->getErrors();
                continue 1;
            }
        }

        return $returnData;
    }

    /**
     * @param $id
     * @param $data
     *
     * @return array|bool
     */
    private function saveHoursValues($id, $data)
    {
        if (empty($data['ResuLocationHour']) || !isset($data['ResuLocationHour'])) {
            return true;
        }

        $returnData = false;

        foreach ($data['ResuLocationHour'] as $key => $value) {

            if (empty($value['open']) && empty($value['close']))  {
                $returnData = true;
                continue;
            }

            $model = new \resutoran\common\models\ResuLocationHour([
                'resu_day_option_id' => $key,
                'resu_location_id'   => $id,
                'open'               => $value['open'],
                'close'              => $value['close']
            ]);

            if ($model->save()) {
                $returnData = true;
            } else {
                $returnData = $model->getErrors();
            }
        }

        return $returnData;
    }

    /**
     * We are only adding or remove a resu location {option} values.
     *
     * @param       $id
     * @param array $data
     *
     * @return bool
     * @throws \Error
     */
    private function saveResuLocDressOption(string $id = null, array $data = null)
    {
        // if ID provided, but not data, update all items with delete data
        if ($id !== null && $data === null) {
            // Customer::updateAll(['status' => 1], 'status = 2');
            \resutoran\common\models\ResuLocationDressCode::updateAll([
                    'resu_location_id' => $id
                ],
                'updated_at = ' . time() . ' AND deleted_by = ' . \Yii::$app->user->getId()
            );

            return true;
        } elseif ($id !== null && $data !== null) {

            // simplify data array
            foreach ($data as $key => $value) {
                $data[$key] = (int)$value;
            }

            // get location dress code options currently active in the database
            $inDB = \resutoran\common\models\ResuLocationDressCode::find()
                ->select(['resu_location_id', 'resu_dress_code_option_id'])
                ->andwhere(['resu_location_id' => (int)$id])
                ->asArray()
                ->all();

            // simplify data that came from the database
            foreach ($inDB as $key => $value) {
                $inDB[$key] = (int)$value['resu_dress_code_option_id'];
            }

            // if the item is in the array but not in the DB, add it to the DB
            foreach ($data as $key => $value) {

                // if the item is in the array but not in the DB, add it to the DB
                if (!in_array($value, $inDB)) {
                    // if in data AND NOT in DB: add to DB
                    $newItem = new \resutoran\common\models\ResuLocationDressCode([
                        'resu_location_id'          => $id,
                        'resu_dress_code_option_id' => $value
                    ]);

                    if (!$newItem->save()) {
                        Yii::error($newItem->getFirstErrors(), 'warning');
                        throw new \Error('Unable to save new Location Dress Code Option.');
                    }
                }
            }

            // if the item is in the DB, but not in the array, mark item as delete it
            foreach ($inDB as $key => $value) {

                // if the item is in the array but not in the DB, add it to the DB
                if (!in_array($value, $data)) {
                    // if in DB AND NOT in data: mark as deleted in DB
                    $delItem = \resutoran\common\models\ResuLocationDressCode::findOne([
                        'resu_location_id'          => $id,
                        'resu_dress_code_option_id' => $value
                    ]);

                    $delItem->setAttribute('deleted_at', time());

                    if (!$delItem->save()) {
                        Yii::error($delItem->getErrors(), 'warning');
                        throw new \Error('Unable to deleted old Location Dress Code Option.');
                    }
                }
            }

            return true;
        }

        return false;
    }

    /**
     * @param string|null $id
     * @param array|null  $data
     *
     * @return bool
     * @throws \Error
     */
    private function saveBooleanOptionValues(string $id = null, array $data = null)
    {
        foreach ($data as $key => $value) {
            $value = (integer)$value;

            $model = \resutoran\common\models\ResuLocationBoolean::findOne([
                'resu_location_id' => $id,
                'resu_boolean_option_id' => \resutoran\common\models\ResuBooleanOption::find()
                    ->andWhere(['value' => $key])
                    ->one()
                    ->id
            ]);

            if (!empty($model) && isset($model->id) && $value === 0) {
                // data found, new value 0
                $model->setAttributes([
                    'updated_by' => \Yii::$app->user->getId(),
                    'deleted_at' => time()
                ]);
            } elseif (!empty($model) && $value === 1) {
                // mode data found, new value
                $model->setAttributes([
                    'updated_by' => \Yii::$app->user->getId(),
                    'updated_at' => time(),
                    'deleted_at' => null
                ]);
            } elseif (empty($model) && $value === 1) {
                // model data not found, new value 1
                $model = new \resutoran\common\models\ResuLocationBoolean([
                    'resu_location_id'       => $id,
                    'resu_boolean_option_id' => \resutoran\common\models\ResuBooleanOption::find()
                        ->andWhere(['value' => $key])
                        ->one()
                        ->id
                ]);
            }

            if ($model) {
                if (!$model->save()) {
                    Yii::error($model->getErrors(), 'warning');
                    throw new \Error('Unable to deleted old Location Dress Code Option.');
                }
            }
        }

        return true;
    }
}
