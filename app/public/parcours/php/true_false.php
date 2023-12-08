<?php
if(isset($_POST['faux'])){
    header('location: ../../parcours.html?true_false=OK');

} else {
    header('location: ../../');
}
?>