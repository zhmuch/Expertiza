CREATE TABLE `assignment_questionnaires` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `assignment_id` int(11) DEFAULT NULL,
  `questionnaire_id` int(11) DEFAULT NULL,
  `user_id` int(11) DEFAULT NULL,
  `notification_limit` int(11) NOT NULL DEFAULT '15',
  `questionnaire_weight` int(11) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `fk_aq_user_id` (`user_id`),
  KEY `fk_aq_assignments_id` (`assignment_id`),
  KEY `fk_aq_questionnaire_id` (`questionnaire_id`),
  CONSTRAINT `fk_aq_assignments_id` FOREIGN KEY (`assignment_id`) REFERENCES `assignments` (`id`),
  CONSTRAINT `fk_aq_questionnaire_id` FOREIGN KEY (`questionnaire_id`) REFERENCES `questionnaires` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=6050 DEFAULT CHARSET=latin1;

CREATE TABLE `assignments` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `created_at` datetime DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL,
  `name` varchar(255) DEFAULT NULL,
  `directory_path` varchar(255) DEFAULT NULL,
  `submitter_count` int(10) unsigned NOT NULL DEFAULT '0',
  `course_id` int(11) DEFAULT '0',
  `instructor_id` int(11) DEFAULT '0',
  `private` tinyint(1) NOT NULL DEFAULT '0',
  `num_reviews` int(11) NOT NULL DEFAULT '0',
  `num_review_of_reviews` int(10) unsigned NOT NULL DEFAULT '0',
  `num_review_of_reviewers` int(11) NOT NULL DEFAULT '0',
  `review_questionnaire_id` int(11) DEFAULT NULL,
  `review_of_review_questionnaire_id` int(11) DEFAULT NULL,
  `teammate_review_questionnaire_id` int(10) DEFAULT NULL,
  `reviews_visible_to_all` tinyint(1) DEFAULT NULL,
  `wiki_type_id` int(11) NOT NULL DEFAULT '0',
  `require_signup` tinyint(1) DEFAULT NULL,
  `num_reviewers` int(10) unsigned NOT NULL DEFAULT '0',
  `spec_location` text,
  `author_feedback_questionnaire_id` int(11) DEFAULT NULL,
  `max_team_size` int(11) NOT NULL DEFAULT '0',
  `staggered_deadline` tinyint(1) DEFAULT NULL,
  `allow_suggestions` tinyint(1) DEFAULT NULL,
  `days_between_submissions` int(11) DEFAULT NULL,
  `review_assignment_strategy` varchar(255) DEFAULT NULL,
  `max_reviews_per_submission` int(11) DEFAULT NULL,
  `review_topic_threshold` int(11) DEFAULT '0',
  `availability_flag` tinyint(1) DEFAULT NULL,
  `copy_flag` tinyint(1) DEFAULT '0',
  `rounds_of_reviews` int(11) DEFAULT '1',
  `microtask` tinyint(1) DEFAULT '0',
  `require_quiz` tinyint(1) DEFAULT NULL,
  `num_quiz_questions` int(11) NOT NULL DEFAULT '0',
  `is_coding_assignment` tinyint(1) DEFAULT NULL,
  `is_intelligent` tinyint(1) DEFAULT NULL,
  `selfreview_questionnaire_id` int(11) DEFAULT NULL,
  `managerreview_questionnaire_id` int(11) DEFAULT NULL,
  `readerreview_questionnaire_id` int(11) DEFAULT NULL,
  `calculate_penalty` tinyint(1) NOT NULL DEFAULT '0',
  `late_policy_id` int(11) DEFAULT NULL,
  `is_penalty_calculated` tinyint(1) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `fk_assignments_review_questionnaires` (`review_questionnaire_id`),
  KEY `fk_assignments_review_of_review_questionnaires` (`review_of_review_questionnaire_id`),
  KEY `fk_assignments_wiki_types` (`wiki_type_id`),
  KEY `fk_assignments_instructors` (`instructor_id`),
  KEY `fk_assignments_courses` (`course_id`),
  KEY `fk_late_policy_id` (`late_policy_id`),
  CONSTRAINT `fk_assignments_instructors` FOREIGN KEY (`instructor_id`) REFERENCES `users` (`id`),
  CONSTRAINT `fk_assignments_review_of_review_questionnaires` FOREIGN KEY (`review_of_review_questionnaire_id`) REFERENCES `questionnaires` (`id`),
  CONSTRAINT `fk_assignments_review_questionnaires` FOREIGN KEY (`review_questionnaire_id`) REFERENCES `questionnaires` (`id`),
  CONSTRAINT `fk_assignments_wiki_types` FOREIGN KEY (`wiki_type_id`) REFERENCES `wiki_types` (`id`),
  CONSTRAINT `fk_late_policy_id` FOREIGN KEY (`late_policy_id`) REFERENCES `late_policies` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=695 DEFAULT CHARSET=latin1;

CREATE TABLE `automated_metareviews` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `relevance` float DEFAULT NULL,
  `content_summative` float DEFAULT NULL,
  `content_problem` float DEFAULT NULL,
  `content_advisory` float DEFAULT NULL,
  `tone_positive` float DEFAULT NULL,
  `tone_negative` float DEFAULT NULL,
  `tone_neutral` float DEFAULT NULL,
  `quantity` int(11) DEFAULT NULL,
  `plagiarism` int(11) DEFAULT NULL,
  `version_num` int(11) DEFAULT NULL,
  `response_id` int(11) DEFAULT NULL,
  `created_at` datetime DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `fk_automated_metareviews_responses_id` (`response_id`),
  CONSTRAINT `fk_automated_metareviews_responses_id` FOREIGN KEY (`response_id`) REFERENCES `responses` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=247 DEFAULT CHARSET=latin1;

CREATE TABLE `bids` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `topic_id` int(11) DEFAULT NULL,
  `team_id` int(11) DEFAULT NULL,
  `created_at` datetime DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

CREATE TABLE `bmapping_ratings` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `bmapping_id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  `rating` int(11) NOT NULL,
  `created_at` datetime DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

CREATE TABLE `bmappings` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `bookmark_id` int(11) NOT NULL,
  `title` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `user_id` int(11) NOT NULL,
  `description` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `date_created` datetime NOT NULL,
  `date_modified` datetime NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

CREATE TABLE `bmappings_sign_up_topics` (
  `sign_up_topic_id` int(11) NOT NULL,
  `bmapping_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

CREATE TABLE `bmappings_tags` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `tag_id` int(11) NOT NULL,
  `bmapping_id` int(11) NOT NULL,
  `created_at` datetime DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

CREATE TABLE `bookmark_rating_rubrics` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `display_text` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `minimum_rating` int(11) NOT NULL,
  `maximum_rating` int(11) NOT NULL,
  `created_at` datetime DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

CREATE TABLE `bookmark_tags` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `tag_name` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `created_at` datetime DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

CREATE TABLE `bookmarks` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `url` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `discoverer_user_id` int(11) NOT NULL,
  `user_count` int(11) NOT NULL,
  `created_at` datetime DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

CREATE TABLE `books` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `created_at` datetime DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

CREATE TABLE `calculated_penalties` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `participant_id` int(11) DEFAULT NULL,
  `deadline_type_id` int(11) DEFAULT NULL,
  `penalty_points` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

CREATE TABLE `comments` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `participant_id` int(11) NOT NULL DEFAULT '0',
  `private` tinyint(1) NOT NULL DEFAULT '0',
  `comment` text NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

CREATE TABLE `content_pages` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `title` varchar(255) DEFAULT NULL,
  `name` varchar(255) NOT NULL DEFAULT '',
  `markup_style_id` int(11) DEFAULT NULL,
  `content` text,
  `permission_id` int(11) NOT NULL DEFAULT '0',
  `created_at` datetime DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL,
  `content_cache` text,
  PRIMARY KEY (`id`),
  KEY `fk_content_page_permission_id` (`permission_id`),
  KEY `fk_content_page_markup_style_id` (`markup_style_id`)
) ENGINE=InnoDB AUTO_INCREMENT=12 DEFAULT CHARSET=latin1;

CREATE TABLE `controller_actions` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `site_controller_id` int(11) NOT NULL DEFAULT '0',
  `name` varchar(255) NOT NULL DEFAULT '',
  `permission_id` int(11) DEFAULT NULL,
  `url_to_use` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `fk_controller_action_permission_id` (`permission_id`),
  KEY `fk_controller_action_site_controller_id` (`site_controller_id`)
) ENGINE=InnoDB AUTO_INCREMENT=111 DEFAULT CHARSET=latin1;

CREATE TABLE `courses` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) DEFAULT NULL,
  `instructor_id` int(11) DEFAULT NULL,
  `directory_path` varchar(255) DEFAULT NULL,
  `info` text,
  `created_at` datetime DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL,
  `private` tinyint(1) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `fk_course_users` (`instructor_id`),
  CONSTRAINT `fk_course_users` FOREIGN KEY (`instructor_id`) REFERENCES `users` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=150 DEFAULT CHARSET=latin1;

CREATE TABLE `deadline_rights` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(32) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=latin1;

CREATE TABLE `deadline_types` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(32) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=12 DEFAULT CHARSET=latin1;

CREATE TABLE `delayed_jobs` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `priority` int(11) DEFAULT '0',
  `attempts` int(11) DEFAULT '0',
  `handler` text,
  `last_error` text,
  `run_at` datetime DEFAULT NULL,
  `locked_at` datetime DEFAULT NULL,
  `failed_at` datetime DEFAULT NULL,
  `locked_by` varchar(255) DEFAULT NULL,
  `created_at` datetime DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL,
  `queue` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `delayed_jobs_priority` (`priority`,`run_at`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

CREATE TABLE `due_dates` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `due_at` datetime DEFAULT NULL,
  `deadline_type_id` int(11) DEFAULT NULL,
  `assignment_id` int(11) DEFAULT NULL,
  `submission_allowed_id` int(11) DEFAULT NULL,
  `review_allowed_id` int(11) DEFAULT NULL,
  `resubmission_allowed_id` int(11) DEFAULT NULL,
  `rereview_allowed_id` int(11) DEFAULT NULL,
  `review_of_review_allowed_id` int(11) DEFAULT NULL,
  `round` int(11) DEFAULT NULL,
  `flag` tinyint(1) DEFAULT '0',
  `threshold` int(11) DEFAULT '1',
  `delayed_job_id` int(11) DEFAULT NULL,
  `quiz_allowed_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `fk_deadline_type_due_date` (`deadline_type_id`),
  KEY `fk_due_dates_assignments` (`assignment_id`),
  KEY `fk_due_date_submission_allowed` (`submission_allowed_id`),
  KEY `fk_due_date_review_allowed` (`review_allowed_id`),
  KEY `fk_due_date_resubmission_allowed` (`resubmission_allowed_id`),
  KEY `fk_due_date_rereview_allowed` (`rereview_allowed_id`),
  KEY `fk_due_date_review_of_review_allowed` (`review_of_review_allowed_id`),
  CONSTRAINT `fk_deadline_type_due_date` FOREIGN KEY (`deadline_type_id`) REFERENCES `deadline_types` (`id`),
  CONSTRAINT `fk_due_dates_assignments` FOREIGN KEY (`assignment_id`) REFERENCES `assignments` (`id`),
  CONSTRAINT `fk_due_date_rereview_allowed` FOREIGN KEY (`rereview_allowed_id`) REFERENCES `deadline_rights` (`id`),
  CONSTRAINT `fk_due_date_resubmission_allowed` FOREIGN KEY (`resubmission_allowed_id`) REFERENCES `deadline_rights` (`id`),
  CONSTRAINT `fk_due_date_review_allowed` FOREIGN KEY (`review_allowed_id`) REFERENCES `deadline_rights` (`id`),
  CONSTRAINT `fk_due_date_review_of_review_allowed` FOREIGN KEY (`review_of_review_allowed_id`) REFERENCES `deadline_rights` (`id`),
  CONSTRAINT `fk_due_date_submission_allowed` FOREIGN KEY (`submission_allowed_id`) REFERENCES `deadline_rights` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3690 DEFAULT CHARSET=latin1;

CREATE TABLE `institutions` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) NOT NULL DEFAULT '',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=latin1;

CREATE TABLE `invitations` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `assignment_id` int(11) DEFAULT NULL,
  `from_id` int(11) DEFAULT NULL,
  `to_id` int(11) DEFAULT NULL,
  `reply_status` char(1) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `fk_invitationfrom_users` (`from_id`),
  KEY `fk_invitationto_users` (`to_id`),
  KEY `fk_invitation_assignments` (`assignment_id`),
  CONSTRAINT `fk_invitationfrom_users` FOREIGN KEY (`from_id`) REFERENCES `users` (`id`),
  CONSTRAINT `fk_invitationto_users` FOREIGN KEY (`to_id`) REFERENCES `users` (`id`),
  CONSTRAINT `fk_invitation_assignments` FOREIGN KEY (`assignment_id`) REFERENCES `assignments` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2502 DEFAULT CHARSET=latin1;

CREATE TABLE `join_team_requests` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `participant_id` int(11) DEFAULT NULL,
  `team_id` int(11) DEFAULT NULL,
  `comments` text,
  `status` char(1) DEFAULT NULL,
  `created_at` datetime DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=23 DEFAULT CHARSET=latin1;

CREATE TABLE `languages` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(32) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

CREATE TABLE `late_policies` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `penalty_per_unit` float DEFAULT NULL,
  `max_penalty` int(11) NOT NULL DEFAULT '0',
  `penalty_unit` varchar(255) NOT NULL,
  `times_used` int(11) NOT NULL DEFAULT '0',
  `instructor_id` int(11) NOT NULL,
  `policy_name` varchar(255) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `fk_instructor_id` (`instructor_id`),
  CONSTRAINT `fk_instructor_id` FOREIGN KEY (`instructor_id`) REFERENCES `users` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=latin1;

CREATE TABLE `leaderboards` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `questionnaire_type_id` int(11) DEFAULT NULL,
  `name` varchar(255) DEFAULT NULL,
  `qtype` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=latin1;

CREATE TABLE `markup_styles` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) NOT NULL DEFAULT '',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=latin1;

CREATE TABLE `menu_items` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `parent_id` int(11) DEFAULT NULL,
  `name` varchar(255) NOT NULL DEFAULT '',
  `label` varchar(255) NOT NULL DEFAULT '',
  `seq` int(11) DEFAULT NULL,
  `controller_action_id` int(11) DEFAULT NULL,
  `content_page_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `fk_menu_item_controller_action_id` (`controller_action_id`),
  KEY `fk_menu_item_content_page_id` (`content_page_id`),
  KEY `fk_menu_item_parent_id` (`parent_id`)
) ENGINE=InnoDB AUTO_INCREMENT=51 DEFAULT CHARSET=latin1;

CREATE TABLE `nodes` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `parent_id` int(11) DEFAULT NULL,
  `node_object_id` int(11) DEFAULT NULL,
  `type` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=16435 DEFAULT CHARSET=latin1;

CREATE TABLE `participant_team_roles` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `role_assignment_id` int(11) DEFAULT NULL,
  `participant_id` int(11) DEFAULT NULL,
  `created_at` datetime DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `fk_role_assignment_id` (`role_assignment_id`),
  KEY `fk_participant_id` (`participant_id`),
  CONSTRAINT `fk_participant_id` FOREIGN KEY (`participant_id`) REFERENCES `participants` (`id`),
  CONSTRAINT `fk_role_assignment_id` FOREIGN KEY (`role_assignment_id`) REFERENCES `teamrole_assignment` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

CREATE TABLE `participants` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `submit_allowed` tinyint(1) DEFAULT '1',
  `review_allowed` tinyint(1) DEFAULT '1',
  `user_id` int(11) DEFAULT NULL,
  `parent_id` int(11) DEFAULT NULL,
  `directory_num` int(11) DEFAULT NULL,
  `submitted_at` datetime DEFAULT NULL,
  `permission_granted` tinyint(1) DEFAULT NULL,
  `penalty_accumulated` int(10) unsigned NOT NULL DEFAULT '0',
  `submitted_hyperlinks` text,
  `grade` float DEFAULT NULL,
  `type` varchar(255) DEFAULT NULL,
  `handle` varchar(255) DEFAULT NULL,
  `topic_id` int(11) DEFAULT NULL,
  `time_stamp` datetime DEFAULT NULL,
  `digital_signature` text,
  `special_role` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `fk_participant_users` (`user_id`),
  CONSTRAINT `fk_participant_users` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=27637 DEFAULT CHARSET=latin1;

CREATE TABLE `permissions` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) NOT NULL DEFAULT '',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=latin1;

CREATE TABLE `plugin_schema_info` (
  `plugin_name` varchar(255) DEFAULT NULL,
  `version` int(11) DEFAULT NULL
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

CREATE TABLE `question_advices` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `question_id` int(11) DEFAULT NULL,
  `score` int(11) DEFAULT NULL,
  `advice` text,
  PRIMARY KEY (`id`),
  KEY `fk_question_question_advices` (`question_id`),
  CONSTRAINT `fk_question_question_advices` FOREIGN KEY (`question_id`) REFERENCES `questions` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=5632 DEFAULT CHARSET=latin1;

CREATE TABLE `question_types` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `q_type` varchar(255) NOT NULL DEFAULT '',
  `parameters` varchar(255) DEFAULT NULL,
  `question_id` int(11) NOT NULL DEFAULT '1',
  PRIMARY KEY (`id`),
  KEY `fk_question_type_question` (`question_id`),
  CONSTRAINT `fk_question_type_question` FOREIGN KEY (`question_id`) REFERENCES `questions` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=484 DEFAULT CHARSET=latin1;

CREATE TABLE `questionnaires` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(64) DEFAULT NULL,
  `instructor_id` int(11) NOT NULL DEFAULT '0',
  `private` tinyint(1) NOT NULL DEFAULT '0',
  `min_question_score` int(11) NOT NULL DEFAULT '0',
  `max_question_score` int(11) DEFAULT NULL,
  `created_at` datetime DEFAULT NULL,
  `updated_at` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `default_num_choices` int(11) DEFAULT NULL,
  `type` varchar(255) DEFAULT NULL,
  `display_type` varchar(255) DEFAULT NULL,
  `instruction_loc` text,
  `section` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=227 DEFAULT CHARSET=latin1;

CREATE TABLE `questions` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `txt` text,
  `true_false` tinyint(1) DEFAULT NULL,
  `weight` int(11) DEFAULT NULL,
  `questionnaire_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `fk_question_questionnaires` (`questionnaire_id`),
  CONSTRAINT `fk_question_questionnaires` FOREIGN KEY (`questionnaire_id`) REFERENCES `questionnaires` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2449 DEFAULT CHARSET=latin1;

CREATE TABLE `quiz_question_choices` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `question_id` int(11) DEFAULT NULL,
  `txt` text COLLATE utf8_unicode_ci,
  `iscorrect` tinyint(1) DEFAULT '0',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

CREATE TABLE `response_maps` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `reviewed_object_id` int(11) NOT NULL DEFAULT '0',
  `reviewer_id` int(11) NOT NULL DEFAULT '0',
  `reviewee_id` int(11) NOT NULL DEFAULT '0',
  `type` varchar(255) NOT NULL DEFAULT '',
  `notification_accepted` tinyint(1) DEFAULT '0',
  `created_at` datetime DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `fk_response_map_reviewer` (`reviewer_id`),
  CONSTRAINT `fk_response_map_reviewer` FOREIGN KEY (`reviewer_id`) REFERENCES `participants` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=83594 DEFAULT CHARSET=latin1;

CREATE TABLE `responses` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `map_id` int(11) NOT NULL DEFAULT '0',
  `additional_comment` text,
  `created_at` datetime DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL,
  `version_num` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `fk_response_response_map` (`map_id`),
  CONSTRAINT `fk_response_response_map` FOREIGN KEY (`map_id`) REFERENCES `response_maps` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=56237 DEFAULT CHARSET=latin1;

CREATE TABLE `resubmission_times` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `participant_id` int(11) DEFAULT NULL,
  `resubmitted_at` datetime DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `fk_resubmission_times_participants` (`participant_id`),
  CONSTRAINT `fk_resubmission_times_participants` FOREIGN KEY (`participant_id`) REFERENCES `participants` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=13005 DEFAULT CHARSET=latin1;

CREATE TABLE `review_comments` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `review_file_id` int(11) DEFAULT NULL,
  `comment_content` text,
  `reviewer_participant_id` int(11) DEFAULT NULL,
  `file_offset` int(11) DEFAULT NULL,
  `created_at` datetime DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL,
  `initial_line_number` int(11) DEFAULT NULL,
  `last_line_number` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

CREATE TABLE `review_files` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `filepath` varchar(255) DEFAULT NULL,
  `author_participant_id` int(11) DEFAULT NULL,
  `version_number` int(11) DEFAULT NULL,
  `created_at` datetime DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=42 DEFAULT CHARSET=latin1;

CREATE TABLE `roles` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) NOT NULL DEFAULT '',
  `parent_id` int(11) DEFAULT NULL,
  `description` varchar(255) NOT NULL DEFAULT '',
  `default_page_id` int(11) DEFAULT NULL,
  `cache` text,
  `created_at` datetime DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `fk_role_parent_id` (`parent_id`),
  KEY `fk_role_default_page_id` (`default_page_id`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=latin1;

CREATE TABLE `roles_permissions` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `role_id` int(11) NOT NULL DEFAULT '0',
  `permission_id` int(11) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `fk_roles_permission_role_id` (`role_id`),
  KEY `fk_roles_permission_permission_id` (`permission_id`)
) ENGINE=InnoDB AUTO_INCREMENT=25 DEFAULT CHARSET=latin1;

CREATE TABLE `schema_migrations` (
  `version` varchar(255) NOT NULL DEFAULT '',
  UNIQUE KEY `unique_schema_migrations` (`version`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

CREATE TABLE `score_caches` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `reviewee_id` int(11) DEFAULT NULL,
  `score` float NOT NULL DEFAULT '0',
  `range` varchar(255) DEFAULT '',
  `object_type` varchar(255) NOT NULL DEFAULT '',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=11226 DEFAULT CHARSET=latin1;

CREATE TABLE `scores` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `question_id` int(11) NOT NULL DEFAULT '0',
  `score` int(11) DEFAULT NULL,
  `comments` text,
  `response_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `fk_score_questions` (`question_id`),
  KEY `fk_score_response` (`response_id`),
  CONSTRAINT `fk_score_questions` FOREIGN KEY (`question_id`) REFERENCES `questions` (`id`),
  CONSTRAINT `fk_score_response` FOREIGN KEY (`response_id`) REFERENCES `responses` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=574623 DEFAULT CHARSET=latin1;

CREATE TABLE `sessions` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `session_id` varchar(255) NOT NULL DEFAULT '',
  `data` mediumtext,
  `created_at` datetime DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `index_sessions_on_session_id` (`session_id`),
  KEY `index_sessions_on_updated_at` (`updated_at`)
) ENGINE=InnoDB AUTO_INCREMENT=118129 DEFAULT CHARSET=latin1;

CREATE TABLE `sign_up_topics` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `topic_name` text NOT NULL,
  `assignment_id` int(11) NOT NULL DEFAULT '0',
  `max_choosers` int(11) NOT NULL DEFAULT '0',
  `category` text,
  `topic_identifier` varchar(10) DEFAULT NULL,
  `micropayment` int(11) DEFAULT '0',
  `bookmark_rating_rubric_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `fk_sign_up_categories_sign_up_topics` (`assignment_id`),
  CONSTRAINT `fk_sign_up_topics_assignments` FOREIGN KEY (`assignment_id`) REFERENCES `assignments` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2703 DEFAULT CHARSET=latin1;

CREATE TABLE `signed_up_users` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `topic_id` int(11) NOT NULL DEFAULT '0',
  `creator_id` int(11) NOT NULL DEFAULT '0',
  `is_waitlisted` tinyint(1) NOT NULL DEFAULT '0',
  `preference_priority_number` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `fk_signed_up_users_sign_up_topics` (`topic_id`),
  CONSTRAINT `fk_signed_up_users_sign_up_topics` FOREIGN KEY (`topic_id`) REFERENCES `sign_up_topics` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=7095 DEFAULT CHARSET=latin1;

CREATE TABLE `site_controllers` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) NOT NULL DEFAULT '',
  `permission_id` int(11) NOT NULL DEFAULT '0',
  `builtin` int(11) DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `fk_site_controller_permission_id` (`permission_id`)
) ENGINE=InnoDB AUTO_INCREMENT=66 DEFAULT CHARSET=latin1;

CREATE TABLE `suggestion_comments` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `comments` text,
  `commenter` varchar(255) DEFAULT NULL,
  `vote` varchar(255) DEFAULT NULL,
  `suggestion_id` int(11) DEFAULT NULL,
  `created_at` datetime DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=22 DEFAULT CHARSET=latin1;

CREATE TABLE `suggestions` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `assignment_id` int(11) DEFAULT NULL,
  `title` varchar(255) DEFAULT NULL,
  `description` text,
  `status` varchar(255) DEFAULT NULL,
  `unityID` varchar(255) DEFAULT NULL,
  `signup_preference` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=42 DEFAULT CHARSET=latin1;

CREATE TABLE `survey_deployments` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `course_evaluation_id` int(11) DEFAULT NULL,
  `start_date` datetime DEFAULT NULL,
  `end_date` datetime DEFAULT NULL,
  `num_of_students` int(11) DEFAULT NULL,
  `last_reminder` datetime DEFAULT NULL,
  `course_id` int(11) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=10 DEFAULT CHARSET=latin1;

CREATE TABLE `survey_participants` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `user_id` int(11) DEFAULT NULL,
  `survey_deployment_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=665 DEFAULT CHARSET=latin1;

CREATE TABLE `survey_responses` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `score` int(10) unsigned DEFAULT NULL,
  `comments` text,
  `assignment_id` int(10) unsigned NOT NULL DEFAULT '0',
  `question_id` int(10) unsigned NOT NULL DEFAULT '0',
  `survey_id` int(10) unsigned NOT NULL DEFAULT '0',
  `email` varchar(255) DEFAULT NULL,
  `survey_deployment_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=463 DEFAULT CHARSET=latin1;

CREATE TABLE `system_settings` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `site_name` varchar(255) NOT NULL DEFAULT '',
  `site_subtitle` varchar(255) DEFAULT NULL,
  `footer_message` varchar(255) DEFAULT '',
  `public_role_id` int(11) NOT NULL DEFAULT '0',
  `session_timeout` int(11) NOT NULL DEFAULT '0',
  `default_markup_style_id` int(11) DEFAULT '0',
  `site_default_page_id` int(11) NOT NULL DEFAULT '0',
  `not_found_page_id` int(11) NOT NULL DEFAULT '0',
  `permission_denied_page_id` int(11) NOT NULL DEFAULT '0',
  `session_expired_page_id` int(11) NOT NULL DEFAULT '0',
  `menu_depth` int(11) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `fk_system_settings_public_role_id` (`public_role_id`),
  KEY `fk_system_settings_site_default_page_id` (`site_default_page_id`),
  KEY `fk_system_settings_not_found_page_id` (`not_found_page_id`),
  KEY `fk_system_settings_permission_denied_page_id` (`permission_denied_page_id`),
  KEY `fk_system_settings_session_expired_page_id` (`session_expired_page_id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=latin1;

CREATE TABLE `ta_mappings` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `ta_id` int(11) DEFAULT NULL,
  `course_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `fk_ta_mappings_ta_id` (`ta_id`),
  KEY `fk_ta_mappings_course_id` (`course_id`),
  CONSTRAINT `fk_ta_mappings_course_id` FOREIGN KEY (`course_id`) REFERENCES `courses` (`id`),
  CONSTRAINT `fk_ta_mappings_ta_id` FOREIGN KEY (`ta_id`) REFERENCES `users` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=83 DEFAULT CHARSET=latin1;

CREATE TABLE `tags` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `tagname` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

CREATE TABLE `team_role_questionnaire` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `team_roles_id` int(11) DEFAULT NULL,
  `questionnaire_id` int(11) DEFAULT NULL,
  `created_at` datetime DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `fk_team_roles_id` (`team_roles_id`),
  KEY `fk_questionnaire_id` (`questionnaire_id`),
  CONSTRAINT `fk_questionnaire_id` FOREIGN KEY (`questionnaire_id`) REFERENCES `questionnaires` (`id`),
  CONSTRAINT `fk_team_roles_id` FOREIGN KEY (`team_roles_id`) REFERENCES `team_roles` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

CREATE TABLE `team_roles` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `role_names` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `questionnaire_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `fk_team_roles_questionnaire` (`questionnaire_id`),
  CONSTRAINT `fk_team_roles_questionnaire` FOREIGN KEY (`questionnaire_id`) REFERENCES `questionnaires` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

CREATE TABLE `team_rolesets` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `roleset_name` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

CREATE TABLE `team_rolesets_maps` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `team_rolesets_id` int(11) DEFAULT NULL,
  `team_role_id` int(11) DEFAULT NULL,
  `created_at` datetime DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `fk_team_rolesets_id` (`team_rolesets_id`),
  KEY `fk_team_role_id` (`team_role_id`),
  CONSTRAINT `fk_team_rolesets_id` FOREIGN KEY (`team_rolesets_id`) REFERENCES `team_rolesets` (`id`),
  CONSTRAINT `fk_team_role_id` FOREIGN KEY (`team_role_id`) REFERENCES `team_roles` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

CREATE TABLE `teamrole_assignment` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `team_roleset_id` int(11) DEFAULT NULL,
  `assignment_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `fk_teamrole_assignment_team_rolesets` (`team_roleset_id`),
  KEY `fk_teamrole_assignment_assignments` (`assignment_id`),
  CONSTRAINT `fk_teamrole_assignment_assignments` FOREIGN KEY (`assignment_id`) REFERENCES `assignments` (`id`),
  CONSTRAINT `fk_teamrole_assignment_team_rolesets` FOREIGN KEY (`team_roleset_id`) REFERENCES `team_rolesets` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

CREATE TABLE `teams` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) DEFAULT NULL,
  `parent_id` int(11) DEFAULT NULL,
  `type` varchar(255) DEFAULT NULL,
  `comments_for_advertisement` text,
  `advertise_for_partner` tinyint(1) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=23265 DEFAULT CHARSET=latin1;

CREATE TABLE `teams_users` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `team_id` int(11) DEFAULT NULL,
  `user_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `fk_users_teams` (`team_id`),
  KEY `fk_teams_users` (`user_id`),
  CONSTRAINT `fk_teams_users` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`),
  CONSTRAINT `fk_users_teams` FOREIGN KEY (`team_id`) REFERENCES `teams` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=27072 DEFAULT CHARSET=latin1;

CREATE TABLE `topic_deadlines` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `due_at` datetime DEFAULT NULL,
  `deadline_type_id` int(11) DEFAULT NULL,
  `topic_id` int(11) DEFAULT NULL,
  `late_policy_id` int(11) DEFAULT NULL,
  `submission_allowed_id` int(11) DEFAULT NULL,
  `review_allowed_id` int(11) DEFAULT NULL,
  `resubmission_allowed_id` int(11) DEFAULT NULL,
  `rereview_allowed_id` int(11) DEFAULT NULL,
  `review_of_review_allowed_id` int(11) DEFAULT NULL,
  `round` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `fk_deadline_type_topic_deadlines` (`deadline_type_id`),
  KEY `fk_topic_deadlines_topics` (`topic_id`),
  KEY `fk_topic_deadlines_late_policies` (`late_policy_id`),
  KEY `idx_submission_allowed` (`submission_allowed_id`),
  KEY `idx_review_allowed` (`review_allowed_id`),
  KEY `idx_resubmission_allowed` (`resubmission_allowed_id`),
  KEY `idx_rereview_allowed` (`rereview_allowed_id`),
  KEY `idx_review_of_review_allowed` (`review_of_review_allowed_id`),
  CONSTRAINT `fk_topic_deadlines_deadline_type` FOREIGN KEY (`deadline_type_id`) REFERENCES `deadline_types` (`id`),
  CONSTRAINT `fk_topic_deadlines_late_policies` FOREIGN KEY (`late_policy_id`) REFERENCES `late_policies` (`id`),
  CONSTRAINT `fk_topic_deadlines_sign_up_topic` FOREIGN KEY (`topic_id`) REFERENCES `sign_up_topics` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3673 DEFAULT CHARSET=latin1;

CREATE TABLE `topic_dependencies` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `topic_id` int(11) NOT NULL DEFAULT '0',
  `dependent_on` varchar(255) NOT NULL DEFAULT '',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=63 DEFAULT CHARSET=latin1;

CREATE TABLE `tree_folders` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) DEFAULT NULL,
  `child_type` varchar(255) DEFAULT NULL,
  `parent_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=13 DEFAULT CHARSET=latin1;

CREATE TABLE `users` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) NOT NULL DEFAULT '',
  `crypted_password` varchar(40) NOT NULL DEFAULT '',
  `role_id` int(11) NOT NULL DEFAULT '0',
  `password_salt` varchar(255) DEFAULT NULL,
  `fullname` varchar(255) DEFAULT NULL,
  `email` varchar(255) DEFAULT NULL,
  `parent_id` int(11) DEFAULT NULL,
  `private_by_default` tinyint(1) DEFAULT '0',
  `mru_directory_path` varchar(128) DEFAULT NULL,
  `email_on_review` tinyint(1) DEFAULT NULL,
  `email_on_submission` tinyint(1) DEFAULT NULL,
  `email_on_review_of_review` tinyint(1) DEFAULT NULL,
  `is_new_user` tinyint(1) NOT NULL DEFAULT '1',
  `master_permission_granted` tinyint(4) DEFAULT '0',
  `handle` varchar(255) DEFAULT NULL,
  `leaderboard_privacy` tinyint(1) DEFAULT '0',
  `digital_certificate` text,
  `persistence_token` varchar(255) DEFAULT NULL,
  `timezonepref` varchar(255) DEFAULT NULL,
  `public_key` text,
  `copy_of_emails` tinyint(1) DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `fk_user_role_id` (`role_id`)
) ENGINE=InnoDB AUTO_INCREMENT=5499 DEFAULT CHARSET=latin1;

CREATE TABLE `versions` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `item_type` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `item_id` int(11) NOT NULL,
  `event` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `whodunnit` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `object` text COLLATE utf8_unicode_ci,
  `created_at` datetime DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `index_versions_on_item_type_and_item_id` (`item_type`,`item_id`)
) ENGINE=InnoDB AUTO_INCREMENT=5748 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

CREATE TABLE `wiki_types` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) NOT NULL DEFAULT '',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=latin1;

INSERT INTO schema_migrations (version) VALUES ('0');

INSERT INTO schema_migrations (version) VALUES ('1');

INSERT INTO schema_migrations (version) VALUES ('10');

INSERT INTO schema_migrations (version) VALUES ('100');

INSERT INTO schema_migrations (version) VALUES ('101');

INSERT INTO schema_migrations (version) VALUES ('102');

INSERT INTO schema_migrations (version) VALUES ('103');

INSERT INTO schema_migrations (version) VALUES ('104');

INSERT INTO schema_migrations (version) VALUES ('105');

INSERT INTO schema_migrations (version) VALUES ('106');

INSERT INTO schema_migrations (version) VALUES ('107');

INSERT INTO schema_migrations (version) VALUES ('108');

INSERT INTO schema_migrations (version) VALUES ('109');

INSERT INTO schema_migrations (version) VALUES ('11');

INSERT INTO schema_migrations (version) VALUES ('110');

INSERT INTO schema_migrations (version) VALUES ('111');

INSERT INTO schema_migrations (version) VALUES ('112');

INSERT INTO schema_migrations (version) VALUES ('113');

INSERT INTO schema_migrations (version) VALUES ('114');

INSERT INTO schema_migrations (version) VALUES ('115');

INSERT INTO schema_migrations (version) VALUES ('116');

INSERT INTO schema_migrations (version) VALUES ('117');

INSERT INTO schema_migrations (version) VALUES ('118');

INSERT INTO schema_migrations (version) VALUES ('119');

INSERT INTO schema_migrations (version) VALUES ('12');

INSERT INTO schema_migrations (version) VALUES ('120');

INSERT INTO schema_migrations (version) VALUES ('121');

INSERT INTO schema_migrations (version) VALUES ('122');

INSERT INTO schema_migrations (version) VALUES ('123');

INSERT INTO schema_migrations (version) VALUES ('124');

INSERT INTO schema_migrations (version) VALUES ('125');

INSERT INTO schema_migrations (version) VALUES ('126');

INSERT INTO schema_migrations (version) VALUES ('127');

INSERT INTO schema_migrations (version) VALUES ('128');

INSERT INTO schema_migrations (version) VALUES ('129');

INSERT INTO schema_migrations (version) VALUES ('13');

INSERT INTO schema_migrations (version) VALUES ('130');

INSERT INTO schema_migrations (version) VALUES ('131');

INSERT INTO schema_migrations (version) VALUES ('132');

INSERT INTO schema_migrations (version) VALUES ('133');

INSERT INTO schema_migrations (version) VALUES ('134');

INSERT INTO schema_migrations (version) VALUES ('135');

INSERT INTO schema_migrations (version) VALUES ('136');

INSERT INTO schema_migrations (version) VALUES ('14');

INSERT INTO schema_migrations (version) VALUES ('15');

INSERT INTO schema_migrations (version) VALUES ('16');

INSERT INTO schema_migrations (version) VALUES ('17');

INSERT INTO schema_migrations (version) VALUES ('18');

INSERT INTO schema_migrations (version) VALUES ('19');

INSERT INTO schema_migrations (version) VALUES ('2');

INSERT INTO schema_migrations (version) VALUES ('20');

INSERT INTO schema_migrations (version) VALUES ('20100920141223');

INSERT INTO schema_migrations (version) VALUES ('20101001183244');

INSERT INTO schema_migrations (version) VALUES ('20101018010541');

INSERT INTO schema_migrations (version) VALUES ('20101018010542');

INSERT INTO schema_migrations (version) VALUES ('20101116184601');

INSERT INTO schema_migrations (version) VALUES ('20101116184602');

INSERT INTO schema_migrations (version) VALUES ('20101117031216');

INSERT INTO schema_migrations (version) VALUES ('20101128192024');

INSERT INTO schema_migrations (version) VALUES ('20101205034327');

INSERT INTO schema_migrations (version) VALUES ('20101214034327');

INSERT INTO schema_migrations (version) VALUES ('20101222143748');

INSERT INTO schema_migrations (version) VALUES ('20110205220301');

INSERT INTO schema_migrations (version) VALUES ('20110210160753');

INSERT INTO schema_migrations (version) VALUES ('20110304054311');

INSERT INTO schema_migrations (version) VALUES ('20110323134426');

INSERT INTO schema_migrations (version) VALUES ('20110324001445');

INSERT INTO schema_migrations (version) VALUES ('20110407154154');

INSERT INTO schema_migrations (version) VALUES ('20110408190423');

INSERT INTO schema_migrations (version) VALUES ('20110410232719');

INSERT INTO schema_migrations (version) VALUES ('20110512155258');

INSERT INTO schema_migrations (version) VALUES ('20111023025047');

INSERT INTO schema_migrations (version) VALUES ('20111025015938');

INSERT INTO schema_migrations (version) VALUES ('20111101035638');

INSERT INTO schema_migrations (version) VALUES ('20111118044951');

INSERT INTO schema_migrations (version) VALUES ('20111122004351');

INSERT INTO schema_migrations (version) VALUES ('20111122004447');

INSERT INTO schema_migrations (version) VALUES ('20111124232053');

INSERT INTO schema_migrations (version) VALUES ('20111127035024');

INSERT INTO schema_migrations (version) VALUES ('20111127035200');

INSERT INTO schema_migrations (version) VALUES ('20111129204549');

INSERT INTO schema_migrations (version) VALUES ('20111129215405');

INSERT INTO schema_migrations (version) VALUES ('20111129232252');

INSERT INTO schema_migrations (version) VALUES ('20111130205809');

INSERT INTO schema_migrations (version) VALUES ('20111130230523');

INSERT INTO schema_migrations (version) VALUES ('20111201222103');

INSERT INTO schema_migrations (version) VALUES ('20111202011414');

INSERT INTO schema_migrations (version) VALUES ('20111217162506');

INSERT INTO schema_migrations (version) VALUES ('20120619041353');

INSERT INTO schema_migrations (version) VALUES ('20120829054506');

INSERT INTO schema_migrations (version) VALUES ('20121018001330');

INSERT INTO schema_migrations (version) VALUES ('20121019201555');

INSERT INTO schema_migrations (version) VALUES ('20121116074455');

INSERT INTO schema_migrations (version) VALUES ('20121116081903');

INSERT INTO schema_migrations (version) VALUES ('20121116153522');

INSERT INTO schema_migrations (version) VALUES ('20121116154051');

INSERT INTO schema_migrations (version) VALUES ('20121116154318');

INSERT INTO schema_migrations (version) VALUES ('20121116154625');

INSERT INTO schema_migrations (version) VALUES ('20121116154802');

INSERT INTO schema_migrations (version) VALUES ('20121124073045');

INSERT INTO schema_migrations (version) VALUES ('20121127013927');

INSERT INTO schema_migrations (version) VALUES ('20121128235814');

INSERT INTO schema_migrations (version) VALUES ('20121204121644');

INSERT INTO schema_migrations (version) VALUES ('20121208064006');

INSERT INTO schema_migrations (version) VALUES ('20130403182858');

INSERT INTO schema_migrations (version) VALUES ('20130418214537');

INSERT INTO schema_migrations (version) VALUES ('20130418215246');

INSERT INTO schema_migrations (version) VALUES ('20130606204315');

INSERT INTO schema_migrations (version) VALUES ('20130724031046');

INSERT INTO schema_migrations (version) VALUES ('20130730143615');

INSERT INTO schema_migrations (version) VALUES ('20130827132007');

INSERT INTO schema_migrations (version) VALUES ('20130905183106');

INSERT INTO schema_migrations (version) VALUES ('20130916224736');

INSERT INTO schema_migrations (version) VALUES ('20130930021106');

INSERT INTO schema_migrations (version) VALUES ('20131029020318');

INSERT INTO schema_migrations (version) VALUES ('20131103014327');

INSERT INTO schema_migrations (version) VALUES ('20131108132457');

INSERT INTO schema_migrations (version) VALUES ('20131112015730');

INSERT INTO schema_migrations (version) VALUES ('20131112015931');

INSERT INTO schema_migrations (version) VALUES ('20131112020041');

INSERT INTO schema_migrations (version) VALUES ('20131112020128');

INSERT INTO schema_migrations (version) VALUES ('20131112020213');

INSERT INTO schema_migrations (version) VALUES ('20131112020248');

INSERT INTO schema_migrations (version) VALUES ('20131112020403');

INSERT INTO schema_migrations (version) VALUES ('20131112020440');

INSERT INTO schema_migrations (version) VALUES ('20131112020506');

INSERT INTO schema_migrations (version) VALUES ('20131112020534');

INSERT INTO schema_migrations (version) VALUES ('20131117022304');

INSERT INTO schema_migrations (version) VALUES ('20131117022508');

INSERT INTO schema_migrations (version) VALUES ('20131120032234');

INSERT INTO schema_migrations (version) VALUES ('20131122223434');

INSERT INTO schema_migrations (version) VALUES ('20131123213736');

INSERT INTO schema_migrations (version) VALUES ('20131124173014');

INSERT INTO schema_migrations (version) VALUES ('20131124173146');

INSERT INTO schema_migrations (version) VALUES ('20131124173225');

INSERT INTO schema_migrations (version) VALUES ('20131124173258');

INSERT INTO schema_migrations (version) VALUES ('20131124180730');

INSERT INTO schema_migrations (version) VALUES ('20131124180940');

INSERT INTO schema_migrations (version) VALUES ('20131124181007');

INSERT INTO schema_migrations (version) VALUES ('20131124181037');

INSERT INTO schema_migrations (version) VALUES ('20131201162327');

INSERT INTO schema_migrations (version) VALUES ('20131201172300');

INSERT INTO schema_migrations (version) VALUES ('20131201172400');

INSERT INTO schema_migrations (version) VALUES ('20131201172600');

INSERT INTO schema_migrations (version) VALUES ('20131201172700');

INSERT INTO schema_migrations (version) VALUES ('20131201175200');

INSERT INTO schema_migrations (version) VALUES ('20131203051315');

INSERT INTO schema_migrations (version) VALUES ('20131205154647');

INSERT INTO schema_migrations (version) VALUES ('20131205185858');

INSERT INTO schema_migrations (version) VALUES ('20131205203433');

INSERT INTO schema_migrations (version) VALUES ('20131206231914');

INSERT INTO schema_migrations (version) VALUES ('20140321025833');

INSERT INTO schema_migrations (version) VALUES ('21');

INSERT INTO schema_migrations (version) VALUES ('22');

INSERT INTO schema_migrations (version) VALUES ('23');

INSERT INTO schema_migrations (version) VALUES ('24');

INSERT INTO schema_migrations (version) VALUES ('25');

INSERT INTO schema_migrations (version) VALUES ('26');

INSERT INTO schema_migrations (version) VALUES ('27');

INSERT INTO schema_migrations (version) VALUES ('28');

INSERT INTO schema_migrations (version) VALUES ('29');

INSERT INTO schema_migrations (version) VALUES ('3');

INSERT INTO schema_migrations (version) VALUES ('30');

INSERT INTO schema_migrations (version) VALUES ('31');

INSERT INTO schema_migrations (version) VALUES ('32');

INSERT INTO schema_migrations (version) VALUES ('33');

INSERT INTO schema_migrations (version) VALUES ('34');

INSERT INTO schema_migrations (version) VALUES ('35');

INSERT INTO schema_migrations (version) VALUES ('36');

INSERT INTO schema_migrations (version) VALUES ('37');

INSERT INTO schema_migrations (version) VALUES ('38');

INSERT INTO schema_migrations (version) VALUES ('39');

INSERT INTO schema_migrations (version) VALUES ('4');

INSERT INTO schema_migrations (version) VALUES ('40');

INSERT INTO schema_migrations (version) VALUES ('41');

INSERT INTO schema_migrations (version) VALUES ('42');

INSERT INTO schema_migrations (version) VALUES ('43');

INSERT INTO schema_migrations (version) VALUES ('44');

INSERT INTO schema_migrations (version) VALUES ('45');

INSERT INTO schema_migrations (version) VALUES ('46');

INSERT INTO schema_migrations (version) VALUES ('47');

INSERT INTO schema_migrations (version) VALUES ('48');

INSERT INTO schema_migrations (version) VALUES ('49');

INSERT INTO schema_migrations (version) VALUES ('5');

INSERT INTO schema_migrations (version) VALUES ('50');

INSERT INTO schema_migrations (version) VALUES ('51');

INSERT INTO schema_migrations (version) VALUES ('52');

INSERT INTO schema_migrations (version) VALUES ('53');

INSERT INTO schema_migrations (version) VALUES ('54');

INSERT INTO schema_migrations (version) VALUES ('55');

INSERT INTO schema_migrations (version) VALUES ('56');

INSERT INTO schema_migrations (version) VALUES ('57');

INSERT INTO schema_migrations (version) VALUES ('58');

INSERT INTO schema_migrations (version) VALUES ('59');

INSERT INTO schema_migrations (version) VALUES ('6');

INSERT INTO schema_migrations (version) VALUES ('60');

INSERT INTO schema_migrations (version) VALUES ('61');

INSERT INTO schema_migrations (version) VALUES ('62');

INSERT INTO schema_migrations (version) VALUES ('63');

INSERT INTO schema_migrations (version) VALUES ('64');

INSERT INTO schema_migrations (version) VALUES ('65');

INSERT INTO schema_migrations (version) VALUES ('66');

INSERT INTO schema_migrations (version) VALUES ('67');

INSERT INTO schema_migrations (version) VALUES ('68');

INSERT INTO schema_migrations (version) VALUES ('69');

INSERT INTO schema_migrations (version) VALUES ('7');

INSERT INTO schema_migrations (version) VALUES ('70');

INSERT INTO schema_migrations (version) VALUES ('71');

INSERT INTO schema_migrations (version) VALUES ('72');

INSERT INTO schema_migrations (version) VALUES ('73');

INSERT INTO schema_migrations (version) VALUES ('74');

INSERT INTO schema_migrations (version) VALUES ('75');

INSERT INTO schema_migrations (version) VALUES ('76');

INSERT INTO schema_migrations (version) VALUES ('77');

INSERT INTO schema_migrations (version) VALUES ('78');

INSERT INTO schema_migrations (version) VALUES ('79');

INSERT INTO schema_migrations (version) VALUES ('8');

INSERT INTO schema_migrations (version) VALUES ('80');

INSERT INTO schema_migrations (version) VALUES ('81');

INSERT INTO schema_migrations (version) VALUES ('82');

INSERT INTO schema_migrations (version) VALUES ('83');

INSERT INTO schema_migrations (version) VALUES ('84');

INSERT INTO schema_migrations (version) VALUES ('85');

INSERT INTO schema_migrations (version) VALUES ('86');

INSERT INTO schema_migrations (version) VALUES ('87');

INSERT INTO schema_migrations (version) VALUES ('88');

INSERT INTO schema_migrations (version) VALUES ('89');

INSERT INTO schema_migrations (version) VALUES ('9');

INSERT INTO schema_migrations (version) VALUES ('90');

INSERT INTO schema_migrations (version) VALUES ('91');

INSERT INTO schema_migrations (version) VALUES ('92');

INSERT INTO schema_migrations (version) VALUES ('93');

INSERT INTO schema_migrations (version) VALUES ('94');

INSERT INTO schema_migrations (version) VALUES ('95');

INSERT INTO schema_migrations (version) VALUES ('96');

INSERT INTO schema_migrations (version) VALUES ('97');

INSERT INTO schema_migrations (version) VALUES ('98');

INSERT INTO schema_migrations (version) VALUES ('99');