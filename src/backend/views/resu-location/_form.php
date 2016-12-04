<?php

use yii\bootstrap\ActiveForm;
use yii\helpers\ArrayHelper;
use yii\helpers\Html;
use kartik\widgets\Select2;
use kartik\checkbox\CheckboxX;

/* @var $this yii\web\View */
/* @var $model \resutoran\common\models\ResuLocation */
/* @var $form yii\bootstrap\ActiveForm */

// get country list
$countriesMDL = (new League\ISO3166\ISO3166);
$countriesArray = [];
// remove leading zeros, Would use ArrayHelper::map() but does not remove leading zeros
foreach ($countriesMDL as $key => $value) {
    $countriesArray[(int)$value['numeric']] = $value['name'];
}

// ISO3166-2 (region/prov/state) data access is not yet available, leaving as a manual field for now
?>

<div class="resu-location-form">

    <?php $form = ActiveForm::begin(); ?>

    <?php echo $form->errorSummary($model); ?>

    <?php echo $form->field($model, 'value')->textInput([
        'placeholder' => 'Name of Location',
        'maxlength'   => true
    ]) ?>

    <?php echo $form->field($model, 'address_1')->textInput([
        'placeholder' => 'Address 1',
        'maxlength'   => true
    ]) ?>

    <?php echo $form->field($model, 'address_2')->textInput([
        'placeholder' => 'Address 2',
        'maxlength'   => true
    ]) ?>

    <?php echo $form->field($model, 'province_id')->textInput([
        'placeholder' => 'Prov/State',
        'maxlength'   => true
    ]) ?>

    <?php // $countriesArray ?>
    <?php echo $form->field($model, 'country_id')->textInput([
        'placeholder' => 'Country',
        'maxlength'   => true
    ]) ?>

    <?php echo $form->field($model, 'phone')->textInput([
        'placeholder' => 'Phone',
        'maxlength'   => true
    ]) ?>

    <?php echo $form->field($model, 'email')->textInput([
        'placeholder' => 'Email',
        'maxlength'   => true
    ]) ?>

    <?php // echo $form->field($model, 'resu_franchise_id')->textInput() ?>
    <?php echo $this->render('../partials/Select2', [
        'options' => [
            'clear'     => true,
            'form'      => $form,
            'label'     => 'Franchise',
            'model'     => $model,
            'required'  => true,
        ]
    ]); ?>

    <?php // echo $form->field($model, 'resu_decor_option_id')->textInput() ?>
    <?php echo $this->render('../partials/Select2', [
        'options' => [
            'clear'     => true,
            'form'      => $form,
            'label'     => 'DecorOption',
            'model'     => $model,
            'required'  => true,
        ]
    ]); ?>

    <?php // echo $form->field($model, 'resu_ambiance_option_id')->textInput() ?>
    <?php echo $this->render('../partials/Select2', [
        'options' => [
            'clear'     => true,
            'form'      => $form,
            'label'     => 'AmbianceOption',
            'model'     => $model,
            'required'  => true,
        ]
    ]); ?>

    <?php // echo $form->field($model, 'resu_map_id')->textInput(); ?>
    <?php echo $this->render('../partials/Select2', [
        'options' => [
            'clear'     => true,
            'form'      => $form,
            'label'     => 'Map',
            'model'     => $model,
            'required'  => true,
        ]
    ]); ?>

    <hr>

    <?php
    $days = \resutoran\common\models\ResuDayOption::find()->select(['id', 'value', 'abbr'])->asArray()->all();
    foreach ($days as $key => $value) {
    ?>
        <div class="form-group field-resulocation-value required">
            <?php
            $fieldName = 'ResuLocation[hour_value]['.$value['id'].'][]';

            echo \yii\bootstrap\BaseHtml::label(
                $value['value'],
                $fieldName
            );

            // TODO make this a AR data retrieval, not a SQL request
            $hours = \resutoran\common\models\ResuLocationDay::find()
                ->select('resu_hour_value.value as hour')
                ->andWhere([
                    'resu_location_id' => $model->id,
                    'resu_day_option_id' => $value['id']
                ])
                ->leftJoin('resu_day_option', '`resu_day_option`.`id` = `resu_location_day`.`resu_day_option_id`')
                ->leftJoin('resu_hour_value', '`resu_hour_value`.`id` = `resu_location_day`.`resu_hour_value_id`')
                ->asArray()
                ->all();

            echo \yii\bootstrap\BaseHtml::textInput(
                $fieldName,
                !empty($hours[0]['hour']) ? $hours[0]['hour'] : null,
                [
                    'maxlength'     => 12,
                    'placeholder'   => 'Open-Close hours in 24h format. Exp: 07-13, 15-22',
                    'class'         => 'form-control',

                ]
            ); ?>

            <p class="help-block help-block-error"></p>
        </div>

    <?php }; ?>

    <hr>

    <?php
    // pricing options
    echo \yii\bootstrap\BaseHtml::checkboxList(
        'resu_location_menu',
        null,
        ArrayHelper::map(
            \resutoran\common\models\ResuMenuOption::find()->all(),
            'id',
            'value'
        ),
        [
            'inline' => false,
            'item'   => function($index, $label, $name, $checked, $value) use ($form, $model) {

                $return = '<div class="form-group field-resulocation-resu_location_menu required">
                    <label for="ResuLocation[resu_location_menu]['.$value.'][high_price]">'.$label.'</label>
                    <input type="text" class="form-control" name="ResuLocation[resu_location_menu]['.$value.'][low_price]" maxlength="6" placeholder="Low Price (XXX.YY)">
                    <input type="text" class="form-control" name="ResuLocation[resu_location_menu]['.$value.'][high_price]" maxlength="6" placeholder="High Price  (XXX.YY)">
                    <p class="help-block help-block-error"></p>
                </div>';

                return $return;
            }
        ]
    ); ?>

    <hr />

    <?php
    echo Html::label('Dress Option');
    echo Select2::widget([
        'name'          => 'ResuLocation[location_options][resu_location_dress_code][]',
        'value'         => ArrayHelper::map($model->getResuLocationDressCodes()->asArray()->all(), 'id', 'id'),
        'maintainOrder' => true,
        'data'          => ArrayHelper::map(\resutoran\common\models\ResuDressCodeOption::find()->all(), 'id', 'value'),
        'options'       => [
            'multiple'      => true,
            'placeholder'   => 'Select Dress Code Options ...'
        ]
    ]); ?>

    <?php
    echo Html::label('Seating Option');
    echo Select2::widget([
        'name'      => 'ResuLocation[location_options][resu_location_seating][]',
        'value'     => null,
        'data'      => ArrayHelper::map(\resutoran\common\models\ResuSeatingOption::find()->all(), 'id', 'value'),
        'options'   => [
            'multiple'      => true,
            'placeholder'   => 'Select Seating Options ...'
        ]
    ]); ?>

    <?php
    echo Html::label('Cuisine Option');
    echo Select2::widget([
        'name'      => 'ResuLocation[location_options][resu_location_cuisine][]',
        'value'     => null,
        'data'      => ArrayHelper::map(\resutoran\common\models\ResuCuisineOption::find()->all(), 'id', 'value'),
        'options'   => [
            'multiple'      => true,
            'placeholder'   => 'Select Cuisine Options ...'
        ]
    ]); ?>

    <?php
    echo Html::label('Media Option');
    echo Select2::widget([
        'name'      => 'ResuLocation[location_options][resu_location_media][]',
        'value'     => null,
        'data'      => ArrayHelper::map(\resutoran\common\models\ResuMediaOption::find()->all(), 'id', 'value'),
        'options'   => [
            'multiple'      => true,
            'placeholder'   => 'Select Media Options ...'
        ]
    ]); ?>

    <?php
    echo Html::label('Payment Option');
    echo Select2::widget([
        'name'      => 'ResuLocation[location_options][resu_location_payment][]',
        'value'     => null,
        'data'      => ArrayHelper::map(\resutoran\common\models\ResuPaymentOption::find()->all(), 'id', 'value'),
        'options'   => [
            'multiple'      => true,
            'placeholder'   => 'Select Payment Options ...'
        ]
    ]); ?>

    <hr />

    <?php echo Html::label('Features'); ?><br />

    <?php
    echo \yii\bootstrap\BaseHtml::checkboxList(
        'resu_location_boolean',
        null,
        ArrayHelper::map(
            \resutoran\common\models\ResuBooleanOption::find()->all(),
            'id',
            'value'
        ),
        [
            'inline' => false,
            'item'   => function($index, $label, $name, $checked, $value) {

                $name = 'ResuLocation[resu_location_boolean]['.$index.']';

                echo '<label class="cbx-label" for="'.$name.'">'.$label.'</label>';
                echo CheckboxX::widget([
                    'name'          => $name,
                    'value'         => $label,
                    'pluginOptions' => [
                        'threeState' => false
                    ]
                ]);
            }
        ]
    ); ?>

    <?php // echo $form->field($model, 'created_at')->textInput() ?>

    <?php // echo $form->field($model, 'created_by')->textInput() ?>

    <?php // echo $form->field($model, 'updated_at')->textInput() ?>

    <?php // echo $form->field($model, 'updated_by')->textInput() ?>

    <?php // echo $form->field($model, 'deleted_at')->textInput() ?>

    <div class="form-group">
        <?php echo Html::submitButton($model->isNewRecord
            ? Yii::t('backend', 'Create')
            : Yii::t('backend', 'Update'), ['class' => $model->isNewRecord ? 'btn btn-success' : 'btn btn-primary']);
        ?>
    </div>

    <?php ActiveForm::end(); ?>

</div>