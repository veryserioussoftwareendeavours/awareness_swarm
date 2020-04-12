-- phpMyAdmin SQL Dump
-- version 4.6.6deb5
-- https://www.phpmyadmin.net/
--
-- Host: localhost:3306
-- Generation Time: Apr 10, 2020 at 05:55 AM
-- Server version: 10.3.22-MariaDB-0+deb10u1
-- PHP Version: 7.3.14-1~deb10u1

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `awareness_swarm`
--

-- --------------------------------------------------------

--
-- Table structure for table `AudioFiles`
--

CREATE TABLE `AudioFiles` (
  `id` int(10) UNSIGNED NOT NULL,
  `filename` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Table structure for table `MindObjectAudio`
--

CREATE TABLE `MindObjectAudio` (
  `id` int(10) UNSIGNED NOT NULL,
  `mindobject_id` int(10) UNSIGNED NOT NULL,
  `user_id` int(10) UNSIGNED NOT NULL,
  `filename` varchar(255) NOT NULL,
  `transcription` text NOT NULL,
  `timestamp` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Table structure for table `MindObjectAudioResponse`
--

CREATE TABLE `MindObjectAudioResponse` (
  `id` int(10) UNSIGNED NOT NULL,
  `mind_object_audio_id` int(10) UNSIGNED NOT NULL,
  `user_transcription_keyword_id` int(10) UNSIGNED NOT NULL,
  `timestamp` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Table structure for table `MindObjectLight`
--

CREATE TABLE `MindObjectLight` (
  `id` int(10) UNSIGNED NOT NULL,
  `mindobject_id` int(10) UNSIGNED NOT NULL,
  `timestamp_start` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  `timestamp_end` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Table structure for table `MindObjectMotion`
--

CREATE TABLE `MindObjectMotion` (
  `id` int(10) UNSIGNED NOT NULL,
  `mindobject_id` int(10) UNSIGNED NOT NULL,
  `timestamp_start` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  `timestamp_end` timestamp NULL DEFAULT NULL,
  `distance` int(4) UNSIGNED DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Table structure for table `MindObjectPosition`
--

CREATE TABLE `MindObjectPosition` (
  `id` int(10) UNSIGNED NOT NULL,
  `mindobject_id` int(10) UNSIGNED NOT NULL,
  `timestamp` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  `pos_lat` decimal(9,6) NOT NULL,
  `pos_long` decimal(9,6) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Table structure for table `MindObjects`
--

CREATE TABLE `MindObjects` (
  `id` int(10) UNSIGNED NOT NULL,
  `device_ip` varchar(15) DEFAULT NULL,
  `name` varchar(255) NOT NULL,
  `active` tinyint(1) NOT NULL DEFAULT 0,
  `pos_lat` decimal(9,6) DEFAULT NULL,
  `pos_long` decimal(9,6) DEFAULT NULL,
  `detect_motion` tinyint(1) NOT NULL DEFAULT 1,
  `detect_light` tinyint(1) NOT NULL DEFAULT 1,
  `detect_position` tinyint(1) NOT NULL DEFAULT 1
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Table structure for table `TranscriptionKeywords`
--

CREATE TABLE `TranscriptionKeywords` (
  `id` int(10) UNSIGNED NOT NULL,
  `keyword_phrase` text NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Table structure for table `UserTranscriptionKeywords`
--

CREATE TABLE `UserTranscriptionKeywords` (
  `id` int(10) UNSIGNED NOT NULL,
  `user_id` int(10) UNSIGNED NOT NULL,
  `transcription_keyword_id` int(10) UNSIGNED NOT NULL,
  `audio_file_id` int(10) UNSIGNED NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Indexes for dumped tables
--

--
-- Indexes for table `AudioFiles`
--
ALTER TABLE `AudioFiles`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `MindObjectAudio`
--
ALTER TABLE `MindObjectAudio`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `MindObjectAudioResponse`
--
ALTER TABLE `MindObjectAudioResponse`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `MindObjectLight`
--
ALTER TABLE `MindObjectLight`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `MindObjectMotion`
--
ALTER TABLE `MindObjectMotion`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `MindObjectPosition`
--
ALTER TABLE `MindObjectPosition`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `MindObjects`
--
ALTER TABLE `MindObjects`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `TranscriptionKeywords`
--
ALTER TABLE `TranscriptionKeywords`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `UserTranscriptionKeywords`
--
ALTER TABLE `UserTranscriptionKeywords`
  ADD PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `AudioFiles`
--
ALTER TABLE `AudioFiles`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `MindObjectAudio`
--
ALTER TABLE `MindObjectAudio`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `MindObjectAudioResponse`
--
ALTER TABLE `MindObjectAudioResponse`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `MindObjectLight`
--
ALTER TABLE `MindObjectLight`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `MindObjectMotion`
--
ALTER TABLE `MindObjectMotion`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `MindObjectPosition`
--
ALTER TABLE `MindObjectPosition`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `MindObjects`
--
ALTER TABLE `MindObjects`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `TranscriptionKeywords`
--
ALTER TABLE `TranscriptionKeywords`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `UserTranscriptionKeywords`
--
ALTER TABLE `UserTranscriptionKeywords`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
