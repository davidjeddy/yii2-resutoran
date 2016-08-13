<?php

use yii\helpers\Html;


/* @var $this yii\web\View */
/* @var $model common\models\ResuLocationReservation */

$this->title = Yii::t('backend', 'Create {modelClass}', [
    'modelClass' => 'Location Reservation',
]);
$this->params['breadcrumbs'][] = ['label' => Yii::t('resutoran', ' Location Reservations'), 'url' => ['index']];
$this->params['breadcrumbs'][] = $this->title;
?>
<div class="resu-location-reservation-create">

    <?php echo $this->render('_form', [
        'model' => $model,
    ]) ?>

</div>