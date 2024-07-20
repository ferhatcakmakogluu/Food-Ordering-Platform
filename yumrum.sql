-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Anamakine: 127.0.0.1
-- Üretim Zamanı: 26 May 2024, 21:07:03
-- Sunucu sürümü: 8.1.0
-- PHP Sürümü: 8.0.30

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Veritabanı: `yumrum`
--

-- --------------------------------------------------------

--
-- Tablo için tablo yapısı `admin`
--

CREATE TABLE `admin` (
  `id` int NOT NULL,
  `name` varchar(20) COLLATE utf8mb4_general_ci NOT NULL,
  `password` varchar(50) COLLATE utf8mb4_general_ci NOT NULL,
  `su` int DEFAULT '2',
  `resim` varchar(255) COLLATE utf8mb4_general_ci DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Tablo döküm verisi `admin`
--

INSERT INTO `admin` (`id`, `name`, `password`, `su`, `resim`) VALUES
(1, 'admin', '6216f8a75fd5bb3d5f22b6f9958cdede3fc086c2', 1, NULL),
(16, 'poppeyes', '4f197c99a78b8411f1cf48ab409a0a6d176b99b7', 2, 'Popeyes_logo.svg.png'),
(20, 'tester', '40bd001563085fc35165329ea1ff5c5ecbdbbeef', 2, '1662406820142.jpeg'),
(21, 'zurnaci', '40bd001563085fc35165329ea1ff5c5ecbdbbeef', 2, 'fero.jpg'),
(25, 'firmaYemek', '40bd001563085fc35165329ea1ff5c5ecbdbbeef', 2, 'dish-1.png'),
(26, 'baloğlu', '40bd001563085fc35165329ea1ff5c5ecbdbbeef', 2, 'menu-6.jpg'),
(27, 'kafelab', '7110eda4d09e062aa5e4a390b0a572ac0d2c0220', 2, 'home-img-2.png');

-- --------------------------------------------------------

--
-- Tablo için tablo yapısı `cart`
--

CREATE TABLE `cart` (
  `id` int NOT NULL,
  `user_id` int NOT NULL,
  `pid` int NOT NULL,
  `name` varchar(100) COLLATE utf8mb4_general_ci NOT NULL,
  `price` int NOT NULL,
  `quantity` int NOT NULL,
  `image` varchar(100) COLLATE utf8mb4_general_ci NOT NULL,
  `admin_id` int NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Tablo döküm verisi `cart`
--

INSERT INTO `cart` (`id`, `user_id`, `pid`, `name`, `price`, `quantity`, `image`, `admin_id`) VALUES
(21, 2, 7, 'fero', 61, 4, 'WIN_20240413_15_53_42_Pro.jpg', 0);

-- --------------------------------------------------------

--
-- Tablo için tablo yapısı `category`
--

CREATE TABLE `category` (
  `id` int NOT NULL,
  `name` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Tablo döküm verisi `category`
--

INSERT INTO `category` (`id`, `name`) VALUES
(1, 'fast food'),
(2, 'drinks'),
(3, 'main dish'),
(4, 'dessert');

-- --------------------------------------------------------

--
-- Tablo için tablo yapısı `coupons`
--

CREATE TABLE `coupons` (
  `id` int NOT NULL,
  `admin_id` int NOT NULL,
  `coupon_string` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `type` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `amount` int NOT NULL,
  `end_date` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `min_price` int DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Tablo döküm verisi `coupons`
--

INSERT INTO `coupons` (`id`, `admin_id`, `coupon_string`, `type`, `amount`, `end_date`, `min_price`) VALUES
(15, 16, 'POPINDIRIM10', 'percent', 10, '2024-06-04 21:00:00', 0),
(16, 1, 'TUMRESTINDIRIM20', 'percent', 20, '2024-05-30 21:00:00', 100);

-- --------------------------------------------------------

--
-- Tablo için tablo yapısı `log_messages`
--

CREATE TABLE `log_messages` (
  `id` int NOT NULL,
  `sender_id` int DEFAULT NULL,
  `reciever_id` int DEFAULT NULL,
  `product_id` int DEFAULT NULL,
  `message_date` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  `message` text
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Tablo döküm verisi `log_messages`
--

INSERT INTO `log_messages` (`id`, `sender_id`, `reciever_id`, `product_id`, `message_date`, `message`) VALUES
(1, 6, 16, 11, '2024-05-22 18:06:20', 'merhaba'),
(2, 6, 16, 11, '2024-05-22 18:21:18', 'deneme123'),
(3, 6, 16, 11, '2024-05-22 18:25:38', 'merhaba çaylar nerde kaldı?'),
(4, 16, 6, 11, '2024-05-22 18:25:53', 'yolda efendim gelmek üzere'),
(5, 6, 16, 11, '2024-05-22 18:26:04', 'tamam bekliyorum'),
(6, 6, 16, 11, '2024-05-22 18:29:03', 'deneme'),
(7, 6, 16, 6, '2024-05-22 18:37:09', 'ÇALAR NERDE?'),
(8, 6, 16, 6, '2024-05-22 18:37:21', 'PARDON POPCHİCKEN'),
(9, 16, 6, 6, '2024-05-22 18:37:29', 'GELMEK ÜZERE'),
(10, 6, 16, 11, '2024-05-22 18:37:54', 'ÇAYLARI YOLLLAA'),
(11, 7, 16, 11, '2024-05-22 20:02:03', 'ben mlsa :)'),
(12, 6, 16, 6, '2024-05-22 20:02:48', 'ben ferhat for popchicken'),
(13, 6, 16, 11, '2024-05-22 20:05:23', 'ben ferhat çay'),
(14, 16, 7, 11, '2024-05-22 20:05:50', 'bu mesaj microsoft cay için'),
(15, 16, 6, 6, '2024-05-22 20:05:58', 'bu ferhat pop için'),
(16, 6, 16, 11, '2024-05-22 20:13:15', 'ben kimim'),
(17, 16, 6, 11, '2024-05-22 20:13:24', 'sen ferhat caysın'),
(18, 6, 16, 11, '2024-05-22 20:36:12', 'ferhat cay istiyor'),
(19, 7, 16, 11, '2024-05-22 20:37:22', 'microsoft cayı'),
(20, 16, 7, 11, '2024-05-22 20:37:47', 'adads'),
(21, 7, 16, 6, '2024-05-24 11:51:12', 'ürün ne zaman yola çıkar'),
(22, 16, 7, 6, '2024-05-24 11:51:24', 'az sonra çıkar efendim'),
(23, 8, 16, 6, '2024-05-25 10:10:24', 'hey nerde kaldı'),
(24, 16, 8, 6, '2024-05-25 10:10:34', 'yolda gelioy'),
(25, 8, 16, 6, '2024-05-25 10:27:56', 'nerde kaldı lan bu'),
(26, 16, 8, 6, '2024-05-25 10:28:18', 'aclıktan mı öldu n lan');

-- --------------------------------------------------------

--
-- Tablo için tablo yapısı `messages`
--

CREATE TABLE `messages` (
  `id` int NOT NULL,
  `sender_id` int NOT NULL,
  `reciever_id` int NOT NULL,
  `product_id` int NOT NULL,
  `message_date` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  `message` varchar(500) COLLATE utf8mb4_general_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Tetikleyiciler `messages`
--
DELIMITER $$
CREATE TRIGGER `log_message_insert` AFTER INSERT ON `messages` FOR EACH ROW BEGIN
    INSERT INTO log_messages (sender_id, reciever_id , product_id, message_date, message)
    VALUES (NEW.sender_id, NEW.reciever_id, NEW.product_id, NEW.message_date, NEW.message);
END
$$
DELIMITER ;

-- --------------------------------------------------------

--
-- Tablo için tablo yapısı `orders`
--

CREATE TABLE `orders` (
  `id` int NOT NULL,
  `user_id` int NOT NULL,
  `name` varchar(20) COLLATE utf8mb4_general_ci NOT NULL,
  `number` varchar(10) COLLATE utf8mb4_general_ci NOT NULL,
  `email` varchar(50) COLLATE utf8mb4_general_ci NOT NULL,
  `method` varchar(50) COLLATE utf8mb4_general_ci NOT NULL,
  `address` varchar(500) COLLATE utf8mb4_general_ci NOT NULL,
  `total_products` varchar(1000) COLLATE utf8mb4_general_ci NOT NULL,
  `total_price` int NOT NULL,
  `placed_on` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  `payment_status` varchar(255) COLLATE utf8mb4_general_ci DEFAULT 'pending',
  `admin_id` int DEFAULT NULL,
  `product_id` int NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Tablo döküm verisi `orders`
--

INSERT INTO `orders` (`id`, `user_id`, `name`, `number`, `email`, `method`, `address`, `total_products`, `total_price`, `placed_on`, `payment_status`, `admin_id`, `product_id`) VALUES
(56, 7, 'çay', '123456789', 'mlsa@mlsa.com', 'credit card', '12, 1, bağlık, hatip sokak, zonguldak, ev, türkiye - 67300', 'çay (20 x 1)', 20, '2024-05-22 21:12:45', 'completed', 16, 11),
(57, 7, 'popchiken', '123456789', 'mlsa@mlsa.com', 'credit card', '12, 1, bağlık, hatip sokak, zonguldak, ev, türkiye - 67300', 'popchiken (111 x 3)', 333, '2024-05-22 21:33:20', 'completed', 16, 6),
(58, 6, 'popchiken', '1234567890', 'ferhat@ferhat.com', 'credit card', 'deneme, dene, ev, kule, trabon, araklı, turkey - 61000', 'popchiken (111 x 3)', 333, '2024-05-22 21:57:11', 'completed', 16, 6),
(59, 7, 'popchiken', '123456789', 'mlsa@mlsa.com', 'cash on delivery', '12, 1, bağlık, hatip sokak, zonguldak, ev, türkiye - 67300', 'popchiken (111 x 3)', 333, '2024-05-24 11:50:46', 'completed', 16, 6),
(60, 5, 'tavuk zurna', '123', 'sakirgoogle@gmail.com', 'credit card', '1kh, kh, kh, kh, kh, kh, k - 6151', 'tavuk zurna (110 x 3)', 330, '2024-05-24 12:53:51', 'completed', 21, 10),
(61, 8, 'popchiken', '1234', 'o@o.com', 'cash on delivery', 'aşjda, 1, aslş, aşsl, aaşldk, ev, aşlkd - 12345', 'popchiken (111 x 6)', 666, '2024-05-25 10:07:47', 'completed', 16, 6),
(62, 8, 'çay', '1234', 'o@o.com', 'cash on delivery', 'aşjda, 1, aslş, aşsl, aaşldk, ev, aşlkd - 12345', 'çay (23 x 4)', 92, '2024-05-25 10:07:47', 'completed', 16, 11),
(63, 8, 'popchiken', '1234', 'o@o.com', 'cash on delivery', 'aşjda, 1, aslş, aşsl, aaşldk, ev, aşlkd - 12345', 'popchiken (111 x 1)', 111, '2024-05-25 10:26:16', 'completed', 16, 6),
(64, 8, 'çay', '1234', 'o@o.com', 'cash on delivery', 'aşjda, 1, aslş, aşsl, aaşldk, ev, aşlkd - 12345', 'çay (23 x 3)', 69, '2024-05-25 10:26:16', 'completed', 16, 11),
(65, 8, 'popchiken', '1234', 'o@o.com', 'cash on delivery', 'aşjda, 1, aslş, aşsl, aaşldk, ev, aşlkd - 12345', 'popchiken (81 x 1)', 81, '2024-05-25 19:31:03', 'completed', 16, 6),
(66, 8, 'popchiken', '1234', 'o@o.com', 'credit card', 'aşjda, 1, aslş, aşsl, aaşldk, ev, aşlkd - 12345', 'popchiken (73 x 3)', 219, '2024-05-25 19:39:01', 'completed', 16, 6),
(67, 8, 'çay', '1234', 'o@o.com', 'credit card', 'aşjda, 1, aslş, aşsl, aaşldk, ev, aşlkd - 12345', 'çay (11 x 3)', 33, '2024-05-25 19:39:01', 'completed', 16, 11),
(68, 8, 'çay', '1234', 'o@o.com', 'cash on delivery', 'aşjda, 1, aslş, aşsl, aaşldk, ev, aşlkd - 12345', 'çay (10 x 10)', 100, '2024-05-25 20:22:06', 'pending', 16, 11),
(69, 8, 'çay', '1234', 'o@o.com', 'cash on delivery', 'aşjda, 1, aslş, aşsl, aaşldk, ev, aşlkd - 12345', 'çay (15 x 10)', 150, '2024-05-25 20:24:41', 'pending', 16, 11),
(70, 8, 'çay', '1234', 'o@o.com', 'cash on delivery', 'aşjda, 1, aslş, aşsl, aaşldk, ev, aşlkd - 12345', 'çay (14 x 10)', 140, '2024-05-25 20:26:55', 'pending', 16, 11);

-- --------------------------------------------------------

--
-- Tablo için tablo yapısı `products`
--

CREATE TABLE `products` (
  `id` int NOT NULL,
  `name` varchar(100) COLLATE utf8mb4_general_ci NOT NULL,
  `category` varchar(100) COLLATE utf8mb4_general_ci NOT NULL,
  `price` int NOT NULL,
  `image` varchar(100) COLLATE utf8mb4_general_ci NOT NULL,
  `admin_id` int DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Tablo döküm verisi `products`
--

INSERT INTO `products` (`id`, `name`, `category`, `price`, `image`, `admin_id`) VALUES
(1, 'Burger King', 'fast food', 150, 'images-2.png', 4),
(5, 'zurna durum', 'fast food', 313, 'Burger-King-Logo-1994.png', 6),
(6, 'popchiken', 'main dish', 111, 'qwqwq.jpg', 16),
(7, 'fero', 'drinks', 61, 'WIN_20240413_15_53_42_Pro.jpg', 19),
(8, 'kuymak', 'desserts', 161, '1.jpg', 20),
(9, 'deneme', 'main dish', 321, 'Ferhat.jpeg', 20),
(10, 'tavuk zurna', 'fast food', 110, 'natural-foto-background.png', 21),
(11, 'çay', 'drinks', 15, 'logo.png', 16),
(12, 'pizzaSpeciel', 'fast food', 350, 'home-img-3.png', 25);

-- --------------------------------------------------------

--
-- Tablo için tablo yapısı `product_evaluation`
--

CREATE TABLE `product_evaluation` (
  `id` int NOT NULL,
  `product_id` int NOT NULL,
  `admin_id` int NOT NULL,
  `user_id` int NOT NULL,
  `placed_on` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `evo_message` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL,
  `is_evo` tinyint(1) NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Tablo döküm verisi `product_evaluation`
--

INSERT INTO `product_evaluation` (`id`, `product_id`, `admin_id`, `user_id`, `placed_on`, `evo_message`, `is_evo`) VALUES
(3, 11, 16, 7, '2024-05-22 21:12:45', 'yemek harikaydı', 1),
(4, 6, 16, 7, '2024-05-22 21:33:20', 'bu ürüne bayıldımm', 1),
(5, 6, 16, 6, '2024-05-22 21:57:11', 'popchicken çok iyiii', 1),
(6, 6, 16, 7, '2024-05-24 11:50:46', 'hızlı teslimat', 1),
(7, 10, 21, 5, '2024-05-24 12:53:51', 'güzel bir lezzet', 1),
(8, 6, 16, 8, '2024-05-25 10:07:47', 'lanet bi yemek', 1),
(9, 11, 16, 8, '2024-05-25 10:07:47', 'çok iyidi', 1),
(10, 6, 16, 8, '2024-05-25 10:26:16', 'usluunuz kötü', 1),
(11, 11, 16, 8, '2024-05-25 10:26:16', NULL, 0),
(12, 6, 16, 8, '2024-05-25 19:39:01', NULL, 0),
(13, 11, 16, 8, '2024-05-25 19:39:01', NULL, 0),
(14, 6, 16, 8, '2024-05-25 19:31:03', NULL, 0);

-- --------------------------------------------------------

--
-- Tablo için tablo yapısı `restaurant_demand`
--

CREATE TABLE `restaurant_demand` (
  `id` int NOT NULL,
  `username` varchar(55) NOT NULL,
  `password` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `restaurant_image` varchar(255) NOT NULL,
  `restaurant_info` varchar(255) NOT NULL,
  `status` tinyint(1) NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Tablo döküm verisi `restaurant_demand`
--

INSERT INTO `restaurant_demand` (`id`, `username`, `password`, `restaurant_image`, `restaurant_info`, `status`) VALUES
(1, 'deneme12345', '123', '/update/resim.jpg', 'tatlici', 1),
(7, 'yemekye.co', '123456', 'mlsa.png', 'adasdad', 1),
(12, 'firmaYemek', '40bd001563085fc35165329ea1ff5c5ecbdbbeef', 'dish-1.png', 'yemekk', 1),
(14, 'baloğlu', '40bd001563085fc35165329ea1ff5c5ecbdbbeef', 'menu-6.jpg', 'harika bi yer', 1),
(15, 'kafelab', '7110eda4d09e062aa5e4a390b0a572ac0d2c0220', 'home-img-2.png', 'yeni bir firmayım sisizskfjd', 1);

-- --------------------------------------------------------

--
-- Tablo için tablo yapısı `users`
--

CREATE TABLE `users` (
  `id` int NOT NULL,
  `name` varchar(20) COLLATE utf8mb4_general_ci NOT NULL,
  `email` varchar(50) COLLATE utf8mb4_general_ci NOT NULL,
  `number` varchar(10) COLLATE utf8mb4_general_ci NOT NULL,
  `password` varchar(50) COLLATE utf8mb4_general_ci NOT NULL,
  `address` varchar(500) COLLATE utf8mb4_general_ci DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Tablo döküm verisi `users`
--

INSERT INTO `users` (`id`, `name`, `email`, `number`, `password`, `address`) VALUES
(1, 'dsasdas', 'sada@gm.com', '1', '356a192b7913b04c54574d18c28d46e6395428ab', NULL),
(2, 'Muhammet Olgun', 'mami@gmail.com', '5023839232', '7110eda4d09e062aa5e4a390b0a572ac0d2c0220', 'sad, dasd, da, da, ad, da, ad - 1'),
(3, 'Hasan Ortekin', 'haso@gmail.com', '1231231231', '7110eda4d09e062aa5e4a390b0a572ac0d2c0220', '1, 1, 1, 1, 1, 1, 11 - 11'),
(4, 'fatmanursari', 'fat@gmail.com', '2141241241', '7110eda4d09e062aa5e4a390b0a572ac0d2c0220', '1, 1, 1, 1, 1, 1, 1 - 1'),
(5, 'google', 'sakirgoogle@gmail.com', '123', '7110eda4d09e062aa5e4a390b0a572ac0d2c0220', '1kh, kh, kh, kh, kh, kh, k - 6151'),
(6, 'ferhat cakmakoglu', 'ferhat@ferhat.com', '1234567890', '7c4a8d09ca3762af61e59520943dc26494f8941b', 'deneme, dene, ev, kule, trabon, araklı, turkey - 61000'),
(7, 'microsoft', 'mlsa@mlsa.com', '123456789', '40bd001563085fc35165329ea1ff5c5ecbdbbeef', '12, 1, bağlık, hatip sokak, zonguldak, ev, türkiye - 67300'),
(8, 'oktay', 'o@o.com', '1234', '40bd001563085fc35165329ea1ff5c5ecbdbbeef', 'aşjda, 1, aslş, aşsl, aaşldk, ev, aşlkd - 12345');

--
-- Dökümü yapılmış tablolar için indeksler
--

--
-- Tablo için indeksler `admin`
--
ALTER TABLE `admin`
  ADD PRIMARY KEY (`id`);

--
-- Tablo için indeksler `cart`
--
ALTER TABLE `cart`
  ADD PRIMARY KEY (`id`);

--
-- Tablo için indeksler `category`
--
ALTER TABLE `category`
  ADD PRIMARY KEY (`id`);

--
-- Tablo için indeksler `coupons`
--
ALTER TABLE `coupons`
  ADD PRIMARY KEY (`id`);

--
-- Tablo için indeksler `log_messages`
--
ALTER TABLE `log_messages`
  ADD PRIMARY KEY (`id`);

--
-- Tablo için indeksler `messages`
--
ALTER TABLE `messages`
  ADD PRIMARY KEY (`id`);

--
-- Tablo için indeksler `orders`
--
ALTER TABLE `orders`
  ADD PRIMARY KEY (`id`);

--
-- Tablo için indeksler `products`
--
ALTER TABLE `products`
  ADD PRIMARY KEY (`id`);

--
-- Tablo için indeksler `product_evaluation`
--
ALTER TABLE `product_evaluation`
  ADD PRIMARY KEY (`id`);

--
-- Tablo için indeksler `restaurant_demand`
--
ALTER TABLE `restaurant_demand`
  ADD PRIMARY KEY (`id`);

--
-- Tablo için indeksler `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`id`);

--
-- Dökümü yapılmış tablolar için AUTO_INCREMENT değeri
--

--
-- Tablo için AUTO_INCREMENT değeri `admin`
--
ALTER TABLE `admin`
  MODIFY `id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=28;

--
-- Tablo için AUTO_INCREMENT değeri `cart`
--
ALTER TABLE `cart`
  MODIFY `id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=101;

--
-- Tablo için AUTO_INCREMENT değeri `category`
--
ALTER TABLE `category`
  MODIFY `id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- Tablo için AUTO_INCREMENT değeri `coupons`
--
ALTER TABLE `coupons`
  MODIFY `id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=18;

--
-- Tablo için AUTO_INCREMENT değeri `log_messages`
--
ALTER TABLE `log_messages`
  MODIFY `id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=27;

--
-- Tablo için AUTO_INCREMENT değeri `messages`
--
ALTER TABLE `messages`
  MODIFY `id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=39;

--
-- Tablo için AUTO_INCREMENT değeri `orders`
--
ALTER TABLE `orders`
  MODIFY `id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=71;

--
-- Tablo için AUTO_INCREMENT değeri `products`
--
ALTER TABLE `products`
  MODIFY `id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=13;

--
-- Tablo için AUTO_INCREMENT değeri `product_evaluation`
--
ALTER TABLE `product_evaluation`
  MODIFY `id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=15;

--
-- Tablo için AUTO_INCREMENT değeri `restaurant_demand`
--
ALTER TABLE `restaurant_demand`
  MODIFY `id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=16;

--
-- Tablo için AUTO_INCREMENT değeri `users`
--
ALTER TABLE `users`
  MODIFY `id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
