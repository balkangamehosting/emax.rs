<form action="process.php?task=delete_file" method="POST" style="position: absolute;">
    <a><span>
        <input hidden type="text" name="server_id" value="<?php echo $server['id']; ?>">
        <input hidden type="text" name="file_location" value="<?php echo $_GET['path']; ?>">
        <input hidden type="text" name="file_name" value="<?php echo htmlspecialchars($x['8']); ?>">
        <button><i class="fa fa-remove left"></i></button>
    </span></a>
</form>
<form action="process.php?task=un_file" method="POST" style="position: absolute;margin-top: -13px;">
    <a><span>
        <input hidden type="text" name="server_id" value="<?php echo $server['id']; ?>">
        <input hidden type="text" name="file_location" value="<?php echo $_GET['path']; ?>">
        <input hidden type="text" name="file_name" value="<?php echo htmlspecialchars($x['8']); ?>">
        <input hidden type="text" name="file_ext" value="zip">
        <button><i class="fa fa-download right"></i></button>
    </span></a>
</form>