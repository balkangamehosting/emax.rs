<form action="process.php?task=delete_file" method="POST" style="position: absolute;">
    <a><span>
        <input hidden type="text" name="server_id" value="<?php echo $server['id']; ?>">
        <input hidden type="text" name="file_location" value="<?php echo $_GET['path']; ?>">
        <input hidden type="text" name="file_name" value="<?php echo htmlspecialchars($x['8']); ?>">
        <button><i class="fa fa-remove left"></i></button>
    </span></a>
</form>
<form action="gp-webftp.php?id=<?php echo $server['id']; ?>&path=/&fajl=<?php echo htmlspecialchars($x['8']); ?>" method="POST" style="position: absolute;margin-top: -13px;">
    <a><span>
        <input hidden type="text" name="server_id" value="<?php echo $server['id']; ?>">
        <input hidden type="text" name="file_location" value="<?php echo $_GET['path']; ?>">
        <input hidden type="text" name="file_name" value="<?php echo htmlspecialchars($x['8']); ?>">
        <input hidden type="text" name="dile_ext" value="tar">
        <button><i class="fa fa-edit right"></i></button>
    </span></a>
</form>