<?php

use yii\helpers\Html;

/* @var $this yii\web\View */
/* @var $model resutoran\common\models\Resu[location_options][resu_LocationReservation */

$this->title = Yii::t('backend', 'Update {modelClass}: ', [
    'modelClass' => 'Location Reservation',
]) . ' ' . $model->id;
$this->params['breadcrumbs'][] = ['label' => Yii::t('resutoran', ' Location Reservations'), 'url' => ['index']];
$this->params['breadcrumbs'][] = ['label' => $model->id, 'url' => ['view', 'id' => $model->id]];
$this->params['breadcrumbs'][] = Yii::t('backend', 'Update');
?>
<div class="resu-location-reservation-update">

    <?php echo $this->render('_form', [
        'model' => $model,
    ]) ?>

</div>
