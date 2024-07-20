<?php
if (isset($message)) {
    foreach ($message as $message) {
        echo '
        <div class="message">
            <span>' . $message . '</span>
            <i class="fas fa-times" onclick="this.parentElement.remove();"></i>
        </div>
        ';
    }
}
?>
<?php
            $select_profile = $conn->prepare("SELECT * FROM `admin` WHERE id = ?");
            $select_profile->execute([$admin_id]);
            $fetch_profile = $select_profile->fetch(PDO::FETCH_ASSOC);
            ?>
            
<header class="header">

    <section class="flex">

        <a href="dashboard.php" class="logo">Admin<span>Panel</span></a>

        <nav class="navbar">
            <a href="dashboard.php">anasayfa</a>
            <a href="products.php">urunler</a>
            <a href="placed_orders.php">siparisler</a>
            <?php
            // Sadece su değeri 1 olan adminler için "admins" bağlantısını görüntüle
            if ($fetch_profile['su'] == 1) {
                echo '<a href="admin_accounts.php">admins</a>';
            }
            ?>
            <?php
            // Sadece su değeri 1 olan adminler için "users" bağlantısını görüntüle
            if ($fetch_profile['su'] == 1) {
                echo '<a href="users_accounts.php">users</a>';
            }
            ?>
            <?php if ($fetch_profile['su'] != 1) { ?>
            <a href="messages.php">mesajlar</a>
            <?php } ?>
        </nav>

        <div class="icons">
            <div id="menu-btn" class="fas fa-bars"></div>
            <div id="user-btn" class="fas fa-user"></div>
        </div>

        <div class="profile">
            
            <a href="update_profile.php" class="btn">profil guncelle</a>
            <div class="flex-btn">
                <?php
                // Check if the user is an admin with value 1
                if ($fetch_profile['su'] == 1) {
                    echo '<a href="register_admin.php" class="option-btn">register</a>';
                }
                ?>
            </div>
            <a href="../components/admin_logout.php" onclick="return confirm('Çıkmak istediğine emin misin?');" class="delete-btn">cikis yap</a>
        </div>

    </section>

</header>
