<?php

use yii\helpers\Html;

/* @var $this yii\web\View */
/* @var $model common\models\ResuContact */

$this->title = Yii::t('backend', 'Update {modelClass}: ', [
    'modelClass' => 'Contact',
]) . ' ' . $model->id;
$this->params['breadcrumbs'][] = ['label' => Yii::t('resutoran', ' Contacts'), 'url' => ['index']];
$this->params['breadcrumbs'][] = ['label' => $model->id, 'url' => ['view', 'id' => $model->id]];
$this->params['breadcrumbs'][] = Yii::t('backend', 'Update');
?>
<div class="resu-contact-update">

    <?php echo $this->render('_form', [
        'model' => $model,
    ]) ?>

</div>
