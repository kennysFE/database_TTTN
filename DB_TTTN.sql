/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

CREATE TABLE `BookingDetail` (
  `id` int NOT NULL AUTO_INCREMENT,
  `booking_id` int NOT NULL,
  `so_luong_khach` int NOT NULL,
  `nguoilon` int DEFAULT NULL,
  `treem` int DEFAULT NULL,
  `embe` int DEFAULT NULL,
  `price` int DEFAULT NULL,
  `unit` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `booking_id` (`booking_id`),
  CONSTRAINT `BookingDetail_ibfk_1` FOREIGN KEY (`booking_id`) REFERENCES `BookingRoom` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

CREATE TABLE `BookingRoom` (
  `id` int NOT NULL AUTO_INCREMENT,
  `checkin` datetime NOT NULL,
  `checkout` datetime NOT NULL,
  `note` varchar(255) DEFAULT NULL,
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `customer_id` int NOT NULL,
  `room_id` int NOT NULL,
  PRIMARY KEY (`id`),
  KEY `customer_id` (`customer_id`),
  KEY `room_id` (`room_id`),
  CONSTRAINT `BookingRoom_ibfk_1` FOREIGN KEY (`customer_id`) REFERENCES `Users` (`id`),
  CONSTRAINT `BookingRoom_ibfk_2` FOREIGN KEY (`room_id`) REFERENCES `Room` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

CREATE TABLE `Comments` (
  `id` int NOT NULL AUTO_INCREMENT,
  `room_id` int DEFAULT NULL,
  `customer_id` int DEFAULT NULL,
  `datacomment` varchar(255) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `rate` int DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `customercomment_id` (`customer_id`),
  KEY `idRoom` (`room_id`),
  CONSTRAINT `Comments_ibfk_1` FOREIGN KEY (`customer_id`) REFERENCES `Users` (`id`),
  CONSTRAINT `Comments_ibfk_2` FOREIGN KEY (`room_id`) REFERENCES `Room` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

CREATE TABLE `Image` (
  `id` int NOT NULL AUTO_INCREMENT,
  `room_id` int NOT NULL,
  `urlimage` longtext NOT NULL,
  PRIMARY KEY (`id`),
  KEY `room_id` (`room_id`),
  CONSTRAINT `Image_ibfk_1` FOREIGN KEY (`room_id`) REFERENCES `Room` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=13 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

CREATE TABLE `Location` (
  `id` int NOT NULL AUTO_INCREMENT,
  `location` varchar(255) NOT NULL,
  `provine` varchar(255) NOT NULL,
  `nation` varchar(255) NOT NULL,
  `image` varchar(255) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

CREATE TABLE `Messages` (
  `id` int NOT NULL AUTO_INCREMENT,
  `user1` int NOT NULL,
  `user2` int NOT NULL,
  `message` varchar(1000) NOT NULL,
  `send_id` int NOT NULL,
  `created_at` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`),
  KEY `send_id` (`send_id`),
  CONSTRAINT `Messages_ibfk_1` FOREIGN KEY (`send_id`) REFERENCES `Users` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=162 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

CREATE TABLE `Room` (
  `id` int NOT NULL AUTO_INCREMENT,
  `ten_phong` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  `mo_ta` varchar(255) DEFAULT NULL,
  `gia_tien` int DEFAULT NULL,
  `khach` int DEFAULT NULL,
  `phong_ngu` int DEFAULT NULL,
  `giuong` int DEFAULT NULL,
  `phong_tam` int DEFAULT NULL,
  `may_giat` tinyint(1) DEFAULT NULL,
  `tivi` tinyint(1) DEFAULT NULL,
  `ban_la` tinyint(1) DEFAULT NULL,
  `dieu_hoa` tinyint(1) DEFAULT NULL,
  `wifi` tinyint(1) DEFAULT NULL,
  `bep` tinyint(1) DEFAULT NULL,
  `do_xe` tinyint(1) DEFAULT NULL,
  `ho_boi` tinyint(1) DEFAULT NULL,
  `ban_ui` tinyint(1) DEFAULT NULL,
  `location_id` int NOT NULL,
  PRIMARY KEY (`id`),
  KEY `location_id` (`location_id`),
  CONSTRAINT `Room_ibfk_1` FOREIGN KEY (`location_id`) REFERENCES `Location` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

CREATE TABLE `Typeroom` (
  `room_id` int NOT NULL,
  `typeroom` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`room_id`),
  CONSTRAINT `Typeroom_ibfk_1` FOREIGN KEY (`room_id`) REFERENCES `Room` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

CREATE TABLE `Users` (
  `id` int NOT NULL AUTO_INCREMENT,
  `username` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  `gender` tinyint(1) NOT NULL,
  `phone` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  `email` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  `password` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  `role` varchar(10) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `birthday` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT NULL,
  `avatar` longtext,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;











INSERT INTO `Messages` (`id`, `user1`, `user2`, `message`, `send_id`, `created_at`) VALUES
(156, 8, 7, 'hi', 8, '2022-11-11 05:55:24');
INSERT INTO `Messages` (`id`, `user1`, `user2`, `message`, `send_id`, `created_at`) VALUES
(157, 7, 8, 'okr', 7, '2022-11-11 05:55:31');
INSERT INTO `Messages` (`id`, `user1`, `user2`, `message`, `send_id`, `created_at`) VALUES
(158, 8, 7, ' hlo', 8, '2022-11-11 05:55:50');
INSERT INTO `Messages` (`id`, `user1`, `user2`, `message`, `send_id`, `created_at`) VALUES
(159, 7, 8, ' hi', 7, '2022-11-11 05:55:55'),
(160, 8, 7, ' hi', 8, '2022-11-11 05:55:57'),
(161, 7, 8, 'oke', 7, '2022-11-12 03:59:40');





INSERT INTO `Users` (`id`, `username`, `gender`, `phone`, `email`, `password`, `role`, `created_at`, `birthday`, `avatar`) VALUES
(5, 'hyNgo', 1, '123213', 'ngohy@gmail.com', '1234', 'USER', '2022-11-08 01:40:57', '01/12/2022', NULL);
INSERT INTO `Users` (`id`, `username`, `gender`, `phone`, `email`, `password`, `role`, `created_at`, `birthday`, `avatar`) VALUES
(7, 'concu@gmail.com', 1, '123213', 'ngohy@gmail.com', 'concu123', 'USER', '2022-11-09 04:53:29', '01/12/2022', NULL);
INSERT INTO `Users` (`id`, `username`, `gender`, `phone`, `email`, `password`, `role`, `created_at`, `birthday`, `avatar`) VALUES
(8, 'hy@gmail.com', 1, '12313', 'ngohy@gmail.com', 'hy123456', 'ADMIN', '2022-11-09 05:14:58', '01/12/2022', NULL);


/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;