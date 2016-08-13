<?php

use yii\helpers\Html;


/* @var $this yii\web\View */
/* @var $model common\models\ResuLocationDressCode */

$this->title = Yii::t('backend', 'Create {modelClass}', [
    'modelClass' => 'Location Dress Code',
]);
$this->params['breadcrumbs'][] = ['label' => Yii::t('resutoran', ' Location Dress Codes'), 'url' => ['index']];
$this->params['breadcrumbs'][] = $this->title;
?>
<div class="resu-location-dress-code-create">

    <?php echo $this->render('_form', [
        'model' => $model,
    ]) ?>

</div>
