<?php

namespace resutoran\backend\controllers;

use Yii;
use yii\data\ActiveDataProvider;
use yii\web\Controller;
use yii\web\NotFoundHttpException;
use yii\filters\VerbFilter;

/**
 * Base controller for the `resutoran` module
 */
class BaseController extends Controller
{
    /**
     * @var null
     */
    protected $model = null;

    /**
     * @return array
     */
    public function behaviors()
    {
        return [
            'verbs' => [
                'class' => VerbFilter::classname(),
                'actions' => [
                    'delete' => ['post'],
                ],
            ],
        ];
    }

    /**
     * Lists all ResuAmbianceOption models.
     * @return mixed
     */
    public function actionIndex()
    {
        $model = $this->model;
        $dataProvider = new ActiveDataProvider([
            'query' => $model::find(),
        ]);

        return $this->render('index', [
            'dataProvider' => $dataProvider,
        ]);
    }

    /**
     * Displays a single ResuAmbianceOption model.
     * @param integer $id
     * @return mixed
     */
    public function actionView($id)
    {
        $model = $this->findModel($id);

        return $this->render('view', [
            'model' => $model,
        ]);
    }

    /**
     * Creates a new ResuAmbianceOption model.
     * If creation is successful, the browser will be redirected to the 'view' page.
     * @return mixed
     */
    public function actionCreate()
    {
        $model = new $this->model();

        if ($model->load(Yii::$app->request->post()) && $model->save()) {

            // try to save location option data, else return error provided
            $options = \Yii::$app->request->post()['ResuLocation']['location_options'];
            if (($locationOptions = $this->saveLocationOptions($model, $options)) === true) {
                return $locationOptions;
            }

            return $this->redirect(['view', 'id' => $model->id]);
        } else {
            return $this->render('create', [
                'model' => $model,
            ]);
        }
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
            return $this->redirect(['view', 'id' => $model->id]);
        } else {
            return $this->render('update', [
                'model' => $model,
            ]);
        }
    }

    /**
     * Deletes an existing ResuAmbianceOption model.
     * If deletion is successful, the browser will be redirected to the 'index' page.
     * @param integer $id
     * @return mixed
     */
    public function actionDelete($id)
    {
        $this->findModel($id)->delete();

        return $this->redirect(['index']);
    }

    /**
     * Finds the ResuAmbianceOption model based on its primary key value.
     * If the model is not found, a 404 HTTP exception will be thrown.
     * @param integer $id
     * @return ResuAmbianceOption the loaded model
     * @throws NotFoundHttpException if the model cannot be found
     */
    protected function findModel($id)
    {
        $model = $this->model;
        $model = $model::findOne($id);

        if ($model !== null) {
            return $model;
        } else {
            throw new NotFoundHttpException('The requested page does not exist.');
        }
    }

    /**
     * @return boolean
     */
    private function saveLocationOptions($model, $optionArray)
    {
        $returnData = false;

        foreach ($optionArray as $optionKey => $optionValue) {

            // does the option model class exists?
            $optionMDL = 'resutoran\common\models\\' . \yii\helpers\BaseInflector::camelize( $optionKey );
            if (class_exists($optionMDL)) {

                // create a an AR
                $optionMDL = new $optionMDL;

                // assign the location model id to the optionItem AR object
                $data = ['resu_location_od' => $model->id];
                foreach ($optionValue as $optionItemKey => $optionItemValue) {
                    // todo dynamically get ther option column key - DJE
                    $data['resu_' . $optionItemKey . '_option_id'] = $optionItemValue;
                };
                $optionMDL->setAttributes($data);

                // save location option AR to data store, or return error if present
                if (!$optionMDL->save() || $optionMDL->errors()) {
                    return $optionMDL->getErrors();
                }
            }
        }


        return $returnData;
    }
}
