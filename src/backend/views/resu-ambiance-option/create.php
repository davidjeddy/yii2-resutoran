<?php

use yii\helpers\Html;


/* @var $this yii\web\View */
/* @var $model resutoran\common\models\Resu[location_options][resu_AmbianceOption */

$this->title = Yii::t('backend', 'Create {modelClass}', [
    'modelClass' => 'Ambiance Option',
]);
$this->params['breadcrumbs'][] = ['label' => Yii::t('resutoran', ' Ambiance Options'), 'url' => ['index']];
$this->params['breadcrumbs'][] = $this->title;
?>
<div class="resu-ambiance-option-create">

    <?php echo $this->render('_form', [
        'model' => $model,
    ]) ?>

</div>
