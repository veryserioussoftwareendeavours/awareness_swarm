-- phpMyAdmin SQL Dump
-- version 4.6.6deb5
-- https://www.phpmyadmin.net/
--
-- Host: localhost:3306
-- Generation Time: Apr 15, 2020 at 04:32 PM
-- Server version: 10.3.22-MariaDB-0+deb10u1
-- PHP Version: 7.3.14-1~deb10u1

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `awareness_platform`
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
-- Table structure for table `AwarenessCampaign`
--

CREATE TABLE `AwarenessCampaign` (
  `id` int(10) UNSIGNED NOT NULL,
  `user_id` int(10) UNSIGNED NOT NULL,
  `title` varchar(255) NOT NULL,
  `audio_file_id` int(10) UNSIGNED NOT NULL,
  `daily_ct` int(3) UNSIGNED NOT NULL,
  `response_type` enum('voice_response','button_response') NOT NULL DEFAULT 'voice_response',
  `active` tinyint(1) NOT NULL DEFAULT 1,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  `updated_at` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Table structure for table `AwarenessCampaignRecord`
--

CREATE TABLE `AwarenessCampaignRecord` (
  `id` int(10) UNSIGNED NOT NULL,
  `campaign_id` int(10) UNSIGNED NOT NULL,
  `mind_object_id` int(10) UNSIGNED NOT NULL,
  `count` int(3) UNSIGNED NOT NULL,
  `response` tinyint(1) UNSIGNED NOT NULL DEFAULT 0,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Table structure for table `DreamInterpretations`
--

CREATE TABLE `DreamInterpretations` (
  `id` int(10) UNSIGNED NOT NULL,
  `user_id` int(10) UNSIGNED NOT NULL,
  `initial_sleep_amt` decimal(4,2) NOT NULL,
  `induced_frequency` decimal(3,1) DEFAULT NULL,
  `meditation_duration` int(2) UNSIGNED DEFAULT NULL,
  `binaural_beats_during_sleep` tinyint(1) NOT NULL DEFAULT 1,
  `num_dreams` int(2) UNSIGNED DEFAULT NULL,
  `approx_dream_duration` int(4) UNSIGNED DEFAULT NULL,
  `intensity` int(2) UNSIGNED NOT NULL,
  `clairvoyant_aspects` tinyint(1) UNSIGNED NOT NULL,
  `obe_aspects` tinyint(1) UNSIGNED NOT NULL,
  `lucid_aspects` tinyint(1) UNSIGNED NOT NULL,
  `description` text DEFAULT NULL,
  `interpretation` text DEFAULT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  `updated_at` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 ROW_FORMAT=COMPACT;

-- --------------------------------------------------------

--
-- Table structure for table `DreamInterpretationsKeywords`
--

CREATE TABLE `DreamInterpretationsKeywords` (
  `id` int(10) UNSIGNED NOT NULL,
  `dream_id` int(10) UNSIGNED NOT NULL,
  `keyword_id` int(10) UNSIGNED NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 ROW_FORMAT=COMPACT;

-- --------------------------------------------------------

--
-- Table structure for table `DreamsKeywords`
--

CREATE TABLE `DreamsKeywords` (
  `id` int(10) UNSIGNED NOT NULL,
  `keyword` varchar(255) NOT NULL,
  `description` varchar(255) DEFAULT NULL
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
  `created_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `updated_at` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Table structure for table `MindObjectAudioResponse`
--

CREATE TABLE `MindObjectAudioResponse` (
  `id` int(10) UNSIGNED NOT NULL,
  `mind_object_audio_id` int(10) UNSIGNED NOT NULL,
  `user_transcription_keyword_id` int(10) UNSIGNED NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `updated_at` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Table structure for table `MindObjectLight`
--

CREATE TABLE `MindObjectLight` (
  `id` int(10) UNSIGNED NOT NULL,
  `mindobject_id` int(10) UNSIGNED NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `updated_at` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Table structure for table `MindObjectMotion`
--

CREATE TABLE `MindObjectMotion` (
  `id` int(10) UNSIGNED NOT NULL,
  `mindobject_id` int(10) UNSIGNED NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `updated_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `distance` int(4) UNSIGNED DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Table structure for table `MindObjectPosition`
--

CREATE TABLE `MindObjectPosition` (
  `id` int(10) UNSIGNED NOT NULL,
  `mindobject_id` int(10) UNSIGNED NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `pos_lat` decimal(9,6) NOT NULL,
  `pos_long` decimal(9,6) NOT NULL,
  `updated_at` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Table structure for table `MindObjectReminder`
--

CREATE TABLE `MindObjectReminder` (
  `id` int(10) UNSIGNED NOT NULL,
  `mind_object_id` int(10) UNSIGNED NOT NULL,
  `reminder_id` int(10) UNSIGNED NOT NULL
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
-- Table structure for table `MindsEyeMeditationObjects`
--

CREATE TABLE `MindsEyeMeditationObjects` (
  `id` int(10) UNSIGNED NOT NULL,
  `meditation_id` int(10) UNSIGNED NOT NULL,
  `object_id` int(10) UNSIGNED NOT NULL,
  `sort_order` int(2) UNSIGNED NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 ROW_FORMAT=COMPACT;

-- --------------------------------------------------------

--
-- Table structure for table `MindsEyeMeditations`
--

CREATE TABLE `MindsEyeMeditations` (
  `id` int(10) UNSIGNED NOT NULL,
  `user_id` int(10) UNSIGNED NOT NULL,
  `starting_mind_object` varchar(255) NOT NULL,
  `approx_duration` int(2) DEFAULT NULL,
  `interpretation` text NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  `updated_at` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00',
  `interrupted_by_psychosis` tinyint(1) NOT NULL DEFAULT 1
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Table structure for table `MindsEyeObjects`
--

CREATE TABLE `MindsEyeObjects` (
  `id` int(10) UNSIGNED NOT NULL,
  `mind_object` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 ROW_FORMAT=COMPACT;

-- --------------------------------------------------------

--
-- Table structure for table `Reminder`
--

CREATE TABLE `Reminder` (
  `id` int(10) UNSIGNED NOT NULL,
  `audiofile_id` int(10) UNSIGNED NOT NULL,
  `name` varchar(255) NOT NULL,
  `minute` varchar(5) DEFAULT NULL,
  `hour` varchar(5) DEFAULT NULL,
  `day` varchar(5) DEFAULT NULL,
  `month` varchar(5) DEFAULT NULL,
  `days_of_week` varchar(27) DEFAULT NULL,
  `active` tinyint(1) UNSIGNED NOT NULL DEFAULT 1
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
-- Indexes for table `AwarenessCampaign`
--
ALTER TABLE `AwarenessCampaign`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `AwarenessCampaignRecord`
--
ALTER TABLE `AwarenessCampaignRecord`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `DreamInterpretations`
--
ALTER TABLE `DreamInterpretations`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `DreamInterpretationsKeywords`
--
ALTER TABLE `DreamInterpretationsKeywords`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `DreamsKeywords`
--
ALTER TABLE `DreamsKeywords`
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
-- Indexes for table `MindObjectReminder`
--
ALTER TABLE `MindObjectReminder`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `MindObjects`
--
ALTER TABLE `MindObjects`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `MindsEyeMeditationObjects`
--
ALTER TABLE `MindsEyeMeditationObjects`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `MindsEyeMeditations`
--
ALTER TABLE `MindsEyeMeditations`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `MindsEyeObjects`
--
ALTER TABLE `MindsEyeObjects`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `Reminder`
--
ALTER TABLE `Reminder`
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
-- AUTO_INCREMENT for table `AwarenessCampaign`
--
ALTER TABLE `AwarenessCampaign`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `AwarenessCampaignRecord`
--
ALTER TABLE `AwarenessCampaignRecord`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `DreamInterpretations`
--
ALTER TABLE `DreamInterpretations`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `DreamInterpretationsKeywords`
--
ALTER TABLE `DreamInterpretationsKeywords`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `DreamsKeywords`
--
ALTER TABLE `DreamsKeywords`
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
-- AUTO_INCREMENT for table `MindObjectReminder`
--
ALTER TABLE `MindObjectReminder`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `MindObjects`
--
ALTER TABLE `MindObjects`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `MindsEyeMeditationObjects`
--
ALTER TABLE `MindsEyeMeditationObjects`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `MindsEyeMeditations`
--
ALTER TABLE `MindsEyeMeditations`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `MindsEyeObjects`
--
ALTER TABLE `MindsEyeObjects`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `Reminder`
--
ALTER TABLE `Reminder`
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
