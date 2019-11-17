# WordPress MySQL database migration
#
# Generated: Sunday 17. November 2019 20:39 UTC
# Hostname: localhost
# Database: `wp_artik`
# URL: //localhost/WP-Blog
# Path: /srv/http/WP-Blog
# Tables: wp_commentmeta, wp_comments, wp_lhr_log, wp_links, wp_options, wp_postmeta, wp_posts, wp_term_relationships, wp_term_taxonomy, wp_termmeta, wp_terms, wp_usermeta, wp_users
# Table Prefix: wp_
# Post Types: revision, customize_changeset, nav_menu_item, news, page, post, um_directory, um_form, wp-rest-api-log
# Protocol: http
# Multisite: false
# Subsite Export: false
# --------------------------------------------------------

/*!40101 SET NAMES utf8mb4 */;

SET sql_mode='NO_AUTO_VALUE_ON_ZERO';



#
# Delete any existing table `wp_commentmeta`
#

DROP TABLE IF EXISTS `wp_commentmeta`;


#
# Table structure of table `wp_commentmeta`
#

CREATE TABLE `wp_commentmeta` (
  `meta_id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `comment_id` bigint(20) unsigned NOT NULL DEFAULT 0,
  `meta_key` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `meta_value` longtext COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`meta_id`),
  KEY `comment_id` (`comment_id`),
  KEY `meta_key` (`meta_key`(191))
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;


#
# Data contents of table `wp_commentmeta`
#

#
# End of data contents of table `wp_commentmeta`
# --------------------------------------------------------



#
# Delete any existing table `wp_comments`
#

DROP TABLE IF EXISTS `wp_comments`;


#
# Table structure of table `wp_comments`
#

CREATE TABLE `wp_comments` (
  `comment_ID` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `comment_post_ID` bigint(20) unsigned NOT NULL DEFAULT 0,
  `comment_author` tinytext COLLATE utf8mb4_unicode_ci NOT NULL,
  `comment_author_email` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `comment_author_url` varchar(200) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `comment_author_IP` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `comment_date` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `comment_date_gmt` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `comment_content` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `comment_karma` int(11) NOT NULL DEFAULT 0,
  `comment_approved` varchar(20) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '1',
  `comment_agent` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `comment_type` varchar(20) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `comment_parent` bigint(20) unsigned NOT NULL DEFAULT 0,
  `user_id` bigint(20) unsigned NOT NULL DEFAULT 0,
  PRIMARY KEY (`comment_ID`),
  KEY `comment_post_ID` (`comment_post_ID`),
  KEY `comment_approved_date_gmt` (`comment_approved`,`comment_date_gmt`),
  KEY `comment_date_gmt` (`comment_date_gmt`),
  KEY `comment_parent` (`comment_parent`),
  KEY `comment_author_email` (`comment_author_email`(10))
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;


#
# Data contents of table `wp_comments`
#
INSERT INTO `wp_comments` ( `comment_ID`, `comment_post_ID`, `comment_author`, `comment_author_email`, `comment_author_url`, `comment_author_IP`, `comment_date`, `comment_date_gmt`, `comment_content`, `comment_karma`, `comment_approved`, `comment_agent`, `comment_type`, `comment_parent`, `user_id`) VALUES
(1, 1, 'Коментатор WordPress', 'wapuu@wordpress.example', 'https://wordpress.org/', '', '2019-11-03 12:21:16', '2019-11-03 10:21:16', 'Привіт! Це коментар.\nЩоб почати модерувати, редагувати і видаляти коментарі, перейдіть в розділ Коментарів у Майстерні.\nАватари авторів коментарів завантажуються з сервісу<a href="https://uk.gravatar.com">Gravatar</a>.', 0, 'post-trashed', '', '', 0, 0) ;

#
# End of data contents of table `wp_comments`
# --------------------------------------------------------



#
# Delete any existing table `wp_lhr_log`
#

DROP TABLE IF EXISTS `wp_lhr_log`;


#
# Table structure of table `wp_lhr_log`
#

CREATE TABLE `wp_lhr_log` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `url` text DEFAULT NULL,
  `request_args` mediumtext DEFAULT NULL,
  `response` mediumtext DEFAULT NULL,
  `runtime` varchar(64) DEFAULT NULL,
  `date_added` datetime DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8;


#
# Data contents of table `wp_lhr_log`
#
INSERT INTO `wp_lhr_log` ( `id`, `url`, `request_args`, `response`, `runtime`, `date_added`) VALUES
(1, 'https://api.wordpress.org/events/1.0/', '{"method":"GET","timeout":5,"redirection":5,"httpversion":"1.0","user-agent":"WordPress\\/5.2.4; http:\\/\\/localhost\\/wordpress\\/","reject_unsafe_urls":false,"blocking":true,"headers":[],"cookies":[],"body":{"number":5,"ip":false,"locale":"en_US","timezone":"Europe\\/Kiev"},"compress":false,"decompress":true,"sslverify":true,"sslcertificates":"C:\\\\xampp\\\\htdocs\\\\wordpress\\/wp-includes\\/certificates\\/ca-bundle.crt","stream":false,"filename":null,"limit_response_size":null,"_qm_key":"1572975674.7854https:\\/\\/api.wordpress.org\\/events\\/1.0\\/","_redirection":5}', '{"headers":[],"body":"{\\"sandboxed\\":false,\\"location\\":{\\"ip\\":\\"213.111.67.158\\"},\\"events\\":[{\\"type\\":\\"wordcamp\\",\\"title\\":\\"WordCamp Kyiv\\",\\"url\\":\\"https:\\\\\\/\\\\\\/2019.kyiv.wordcamp.org\\\\\\/\\",\\"meetup\\":null,\\"meetup_url\\":null,\\"date\\":\\"2019-11-09 00:00:00\\",\\"location\\":{\\"location\\":\\"Kyiv\\",\\"country\\":\\"UA\\",\\"latitude\\":50.4317547,\\"longitude\\":30.5129866}}]}","response":{"code":200,"message":"OK"},"cookies":[],"filename":null,"http_response":{"data":null,"headers":null,"status":null}}', '0.48039793968201', '2019-11-05 19:41:15'),
(2, 'https://api.wordpress.org/plugins/update-check/1.1/', '{"method":"POST","timeout":3,"redirection":5,"httpversion":"1.0","user-agent":"WordPress\\/5.2.4; http:\\/\\/localhost\\/wordpress\\/","reject_unsafe_urls":false,"blocking":true,"headers":[],"cookies":[],"body":{"plugins":"{\\"plugins\\":{\\"akismet\\\\\\/akismet.php\\":{\\"Name\\":\\"Akismet Anti-Spam\\",\\"PluginURI\\":\\"https:\\\\\\/\\\\\\/akismet.com\\\\\\/\\",\\"Version\\":\\"4.1.3\\",\\"Description\\":\\"Used by millions, Akismet is quite possibly the best way in the world to <strong>protect your blog from spam<\\\\\\/strong>. It keeps your site protected even while you sleep. To get started: activate the Akismet plugin and then go to your Akismet Settings page to set up your API key.\\",\\"Author\\":\\"Automattic\\",\\"AuthorURI\\":\\"https:\\\\\\/\\\\\\/automattic.com\\\\\\/wordpress-plugins\\\\\\/\\",\\"TextDomain\\":\\"akismet\\",\\"DomainPath\\":\\"\\",\\"Network\\":false,\\"Title\\":\\"Akismet Anti-Spam\\",\\"AuthorName\\":\\"Automattic\\"},\\"hello.php\\":{\\"Name\\":\\"Hello Dolly\\",\\"PluginURI\\":\\"http:\\\\\\/\\\\\\/wordpress.org\\\\\\/plugins\\\\\\/hello-dolly\\\\\\/\\",\\"Version\\":\\"1.7.2\\",\\"Description\\":\\"This is not just a plugin, it symbolizes the hope and enthusiasm of an entire generation summed up in two words sung most famously by Louis Armstrong: Hello, Dolly. When activated you will randomly see a lyric from <cite>Hello, Dolly<\\\\\\/cite> in the upper right of your admin screen on every page.\\",\\"Author\\":\\"Matt Mullenweg\\",\\"AuthorURI\\":\\"http:\\\\\\/\\\\\\/ma.tt\\\\\\/\\",\\"TextDomain\\":\\"\\",\\"DomainPath\\":\\"\\",\\"Network\\":false,\\"Title\\":\\"Hello Dolly\\",\\"AuthorName\\":\\"Matt Mullenweg\\"},\\"better-wp-security\\\\\\/better-wp-security.php\\":{\\"Name\\":\\"iThemes Security\\",\\"PluginURI\\":\\"https:\\\\\\/\\\\\\/ithemes.com\\\\\\/security\\",\\"Version\\":\\"7.4.1\\",\\"Description\\":\\"Take the guesswork out of WordPress security. iThemes Security offers 30+ ways to lock down WordPress in an easy-to-use WordPress security plugin.\\",\\"Author\\":\\"iThemes\\",\\"AuthorURI\\":\\"https:\\\\\\/\\\\\\/ithemes.com\\",\\"TextDomain\\":\\"better-wp-security\\",\\"DomainPath\\":\\"\\",\\"Network\\":true,\\"Title\\":\\"iThemes Security\\",\\"AuthorName\\":\\"iThemes\\"},\\"List Table Proposed News\\\\\\/list-table.php\\":{\\"Name\\":\\"List table\\",\\"PluginURI\\":\\"\\",\\"Version\\":\\"\\",\\"Description\\":\\"\\",\\"Author\\":\\"\\",\\"AuthorURI\\":\\"\\",\\"TextDomain\\":\\"List Table Proposed News\\",\\"DomainPath\\":\\"\\",\\"Network\\":false,\\"Title\\":\\"List table\\",\\"AuthorName\\":\\"\\"},\\"log-http-requests\\\\\\/log-http-requests.php\\":{\\"Name\\":\\"Log HTTP Requests\\",\\"PluginURI\\":\\"\\",\\"Version\\":\\"1.0.4\\",\\"Description\\":\\"Log all those pesky WP HTTP requests\\",\\"Author\\":\\"FacetWP, LLC\\",\\"AuthorURI\\":\\"https:\\\\\\/\\\\\\/facetwp.com\\\\\\/\\",\\"TextDomain\\":\\"log-http-requests\\",\\"DomainPath\\":\\"\\",\\"Network\\":false,\\"Title\\":\\"Log HTTP Requests\\",\\"AuthorName\\":\\"FacetWP, LLC\\"},\\"query-monitor\\\\\\/query-monitor.php\\":{\\"Name\\":\\"Query Monitor\\",\\"PluginURI\\":\\"https:\\\\\\/\\\\\\/querymonitor.com\\\\\\/\\",\\"Version\\":\\"3.4.0\\",\\"Description\\":\\"The Developer Tools Panel for WordPress.\\",\\"Author\\":\\"John Blackbourn\\",\\"AuthorURI\\":\\"https:\\\\\\/\\\\\\/querymonitor.com\\\\\\/\\",\\"TextDomain\\":\\"query-monitor\\",\\"DomainPath\\":\\"\\\\\\/languages\\\\\\/\\",\\"Network\\":false,\\"Title\\":\\"Query Monitor\\",\\"AuthorName\\":\\"John Blackbourn\\"},\\"rest api news\\\\\\/rest-api.php\\":{\\"Name\\":\\"Rest Api for news\\",\\"PluginURI\\":\\"\\",\\"Version\\":\\"\\",\\"Description\\":\\"\\",\\"Author\\":\\"\\",\\"AuthorURI\\":\\"\\",\\"TextDomain\\":\\"rest api news\\",\\"DomainPath\\":\\"\\",\\"Network\\":false,\\"Title\\":\\"Rest Api for news\\",\\"AuthorName\\":\\"\\"},\\"wp-rest-api-log\\\\\\/wp-rest-api-log.php\\":{\\"Name\\":\\"REST API Log\\",\\"PluginURI\\":\\"https:\\\\\\/\\\\\\/github.com\\\\\\/petenelson\\\\\\/wp-rest-api-log\\",\\"Version\\":\\"1.6.7\\",\\"Description\\":\\"Logs requests and responses for the REST API\\",\\"Author\\":\\"Pete Nelson\\",\\"AuthorURI\\":\\"https:\\\\\\/\\\\\\/petenelson.io\\",\\"TextDomain\\":\\"wp-rest-api-log\\",\\"DomainPath\\":\\"\\\\\\/languages\\",\\"Network\\":false,\\"Title\\":\\"REST API Log\\",\\"AuthorName\\":\\"Pete Nelson\\"}},\\"active\\":[\\"query-monitor\\\\\\/query-monitor.php\\",\\"log-http-requests\\\\\\/log-http-requests.php\\"]}","translations":"{\\"akismet\\":{\\"uk\\":{\\"POT-Creation-Date\\":\\"\\",\\"PO-Revision-Date\\":\\"2019-10-31 16:13:27+0000\\",\\"Project-Id-Version\\":\\"Plugins - Akismet Anti-Spam - Stable (latest release)\\",\\"X-Generator\\":\\"GlotPress\\\\\\/2.4.0-alpha\\"}},\\"hello-dolly\\":{\\"uk\\":{\\"POT-Creation-Date\\":\\"\\",\\"PO-Revision-Date\\":\\"2019-06-07 20:53:10+0000\\",\\"Project-Id-Version\\":\\"Plugins - Hello Dolly - Stable (latest release)\\",\\"X-Generator\\":\\"GlotPress\\\\\\/2.4.0-alpha\\"}}}","locale":"[\\"uk\\"]","all":"true"},"compress":false,"decompress":true,"sslverify":true,"sslcertificates":"C:\\\\xampp\\\\htdocs\\\\wordpress\\/wp-includes\\/certificates\\/ca-bundle.crt","stream":false,"filename":null,"limit_response_size":null,"_qm_key":"1572976354.3066https:\\/\\/api.wordpress.org\\/plugins\\/update-check\\/1.1\\/","_redirection":5}', '{"headers":[],"body":"{\\"plugins\\":[],\\"translations\\":[],\\"no_update\\":{\\"akismet\\\\\\/akismet.php\\":{\\"id\\":\\"w.org\\\\\\/plugins\\\\\\/akismet\\",\\"slug\\":\\"akismet\\",\\"plugin\\":\\"akismet\\\\\\/akismet.php\\",\\"new_version\\":\\"4.1.3\\",\\"url\\":\\"https:\\\\\\/\\\\\\/wordpress.org\\\\\\/plugins\\\\\\/akismet\\\\\\/\\",\\"package\\":\\"https:\\\\\\/\\\\\\/downloads.wordpress.org\\\\\\/plugin\\\\\\/akismet.4.1.3.zip\\",\\"icons\\":{\\"2x\\":\\"https:\\\\\\/\\\\\\/ps.w.org\\\\\\/akismet\\\\\\/assets\\\\\\/icon-256x256.png?rev=969272\\",\\"1x\\":\\"https:\\\\\\/\\\\\\/ps.w.org\\\\\\/akismet\\\\\\/assets\\\\\\/icon-128x128.png?rev=969272\\"},\\"banners\\":{\\"1x\\":\\"https:\\\\\\/\\\\\\/ps.w.org\\\\\\/akismet\\\\\\/assets\\\\\\/banner-772x250.jpg?rev=479904\\"},\\"banners_rtl\\":[]},\\"hello.php\\":{\\"id\\":\\"w.org\\\\\\/plugins\\\\\\/hello-dolly\\",\\"slug\\":\\"hello-dolly\\",\\"plugin\\":\\"hello.php\\",\\"new_version\\":\\"1.7.2\\",\\"url\\":\\"https:\\\\\\/\\\\\\/wordpress.org\\\\\\/plugins\\\\\\/hello-dolly\\\\\\/\\",\\"package\\":\\"https:\\\\\\/\\\\\\/downloads.wordpress.org\\\\\\/plugin\\\\\\/hello-dolly.1.7.2.zip\\",\\"icons\\":{\\"2x\\":\\"https:\\\\\\/\\\\\\/ps.w.org\\\\\\/hello-dolly\\\\\\/assets\\\\\\/icon-256x256.jpg?rev=2052855\\",\\"1x\\":\\"https:\\\\\\/\\\\\\/ps.w.org\\\\\\/hello-dolly\\\\\\/assets\\\\\\/icon-128x128.jpg?rev=2052855\\"},\\"banners\\":{\\"1x\\":\\"https:\\\\\\/\\\\\\/ps.w.org\\\\\\/hello-dolly\\\\\\/assets\\\\\\/banner-772x250.jpg?rev=2052855\\"},\\"banners_rtl\\":[]},\\"better-wp-security\\\\\\/better-wp-security.php\\":{\\"id\\":\\"w.org\\\\\\/plugins\\\\\\/better-wp-security\\",\\"slug\\":\\"better-wp-security\\",\\"plugin\\":\\"better-wp-security\\\\\\/better-wp-security.php\\",\\"new_version\\":\\"7.4.1\\",\\"url\\":\\"https:\\\\\\/\\\\\\/wordpress.org\\\\\\/plugins\\\\\\/better-wp-security\\\\\\/\\",\\"package\\":\\"https:\\\\\\/\\\\\\/downloads.wordpress.org\\\\\\/plugin\\\\\\/better-wp-security.7.4.1.zip\\",\\"icons\\":{\\"2x\\":\\"https:\\\\\\/\\\\\\/ps.w.org\\\\\\/better-wp-security\\\\\\/assets\\\\\\/icon-256x256.jpg?rev=969999\\",\\"1x\\":\\"https:\\\\\\/\\\\\\/ps.w.org\\\\\\/better-wp-security\\\\\\/assets\\\\\\/icon.svg?rev=970042\\",\\"svg\\":\\"https:\\\\\\/\\\\\\/ps.w.org\\\\\\/better-wp-security\\\\\\/assets\\\\\\/icon.svg?rev=970042\\"},\\"banners\\":{\\"1x\\":\\"https:\\\\\\/\\\\\\/ps.w.org\\\\\\/better-wp-security\\\\\\/assets\\\\\\/banner-772x250.png?rev=881897\\"},\\"banners_rtl\\":[]},\\"log-http-requests\\\\\\/log-http-requests.php\\":{\\"id\\":\\"w.org\\\\\\/plugins\\\\\\/log-http-requests\\",\\"slug\\":\\"log-http-requests\\",\\"plugin\\":\\"log-http-requests\\\\\\/log-http-requests.php\\",\\"new_version\\":\\"1.0.4\\",\\"url\\":\\"https:\\\\\\/\\\\\\/wordpress.org\\\\\\/plugins\\\\\\/log-http-requests\\\\\\/\\",\\"package\\":\\"https:\\\\\\/\\\\\\/downloads.wordpress.org\\\\\\/plugin\\\\\\/log-http-requests.zip\\",\\"icons\\":{\\"default\\":\\"https:\\\\\\/\\\\\\/s.w.org\\\\\\/plugins\\\\\\/geopattern-icon\\\\\\/log-http-requests.svg\\"},\\"banners\\":[],\\"banners_rtl\\":[]},\\"query-monitor\\\\\\/query-monitor.php\\":{\\"id\\":\\"w.org\\\\\\/plugins\\\\\\/query-monitor\\",\\"slug\\":\\"query-monitor\\",\\"plugin\\":\\"query-monitor\\\\\\/query-monitor.php\\",\\"new_version\\":\\"3.4.0\\",\\"url\\":\\"https:\\\\\\/\\\\\\/wordpress.org\\\\\\/plugins\\\\\\/query-monitor\\\\\\/\\",\\"package\\":\\"https:\\\\\\/\\\\\\/downloads.wordpress.org\\\\\\/plugin\\\\\\/query-monitor.3.4.0.zip\\",\\"icons\\":{\\"2x\\":\\"https:\\\\\\/\\\\\\/ps.w.org\\\\\\/query-monitor\\\\\\/assets\\\\\\/icon-256x256.png?rev=2056073\\",\\"1x\\":\\"https:\\\\\\/\\\\\\/ps.w.org\\\\\\/query-monitor\\\\\\/assets\\\\\\/icon.svg?rev=2056073\\",\\"svg\\":\\"https:\\\\\\/\\\\\\/ps.w.org\\\\\\/query-monitor\\\\\\/assets\\\\\\/icon.svg?rev=2056073\\"},\\"banners\\":{\\"2x\\":\\"https:\\\\\\/\\\\\\/ps.w.org\\\\\\/query-monitor\\\\\\/assets\\\\\\/banner-1544x500.png?rev=1629576\\",\\"1x\\":\\"https:\\\\\\/\\\\\\/ps.w.org\\\\\\/query-monitor\\\\\\/assets\\\\\\/banner-772x250.png?rev=1731469\\"},\\"banners_rtl\\":[]},\\"wp-rest-api-log\\\\\\/wp-rest-api-log.php\\":{\\"id\\":\\"w.org\\\\\\/plugins\\\\\\/wp-rest-api-log\\",\\"slug\\":\\"wp-rest-api-log\\",\\"plugin\\":\\"wp-rest-api-log\\\\\\/wp-rest-api-log.php\\",\\"new_version\\":\\"1.6.7\\",\\"url\\":\\"https:\\\\\\/\\\\\\/wordpress.org\\\\\\/plugins\\\\\\/wp-rest-api-log\\\\\\/\\",\\"package\\":\\"https:\\\\\\/\\\\\\/downloads.wordpress.org\\\\\\/plugin\\\\\\/wp-rest-api-log.1.6.7.zip\\",\\"icons\\":{\\"default\\":\\"https:\\\\\\/\\\\\\/s.w.org\\\\\\/plugins\\\\\\/geopattern-icon\\\\\\/wp-rest-api-log.svg\\"},\\"banners\\":[],\\"banners_rtl\\":[]}}}","response":{"code":200,"message":"OK"},"cookies":[],"filename":null,"http_response":{"data":null,"headers":null,"status":null}}', '0.65096998214722', '2019-11-05 19:52:34') ;

#
# End of data contents of table `wp_lhr_log`
# --------------------------------------------------------



#
# Delete any existing table `wp_links`
#

DROP TABLE IF EXISTS `wp_links`;


#
# Table structure of table `wp_links`
#

CREATE TABLE `wp_links` (
  `link_id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `link_url` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `link_name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `link_image` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `link_target` varchar(25) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `link_description` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `link_visible` varchar(20) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'Y',
  `link_owner` bigint(20) unsigned NOT NULL DEFAULT 1,
  `link_rating` int(11) NOT NULL DEFAULT 0,
  `link_updated` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `link_rel` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `link_notes` mediumtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `link_rss` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  PRIMARY KEY (`link_id`),
  KEY `link_visible` (`link_visible`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;


#
# Data contents of table `wp_links`
#

#
# End of data contents of table `wp_links`
# --------------------------------------------------------



#
# Delete any existing table `wp_options`
#

DROP TABLE IF EXISTS `wp_options`;


#
# Table structure of table `wp_options`
#

CREATE TABLE `wp_options` (
  `option_id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `option_name` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `option_value` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `autoload` varchar(20) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'yes',
  PRIMARY KEY (`option_id`),
  UNIQUE KEY `option_name` (`option_name`)
) ENGINE=InnoDB AUTO_INCREMENT=985 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;


#
# Data contents of table `wp_options`
#
INSERT INTO `wp_options` ( `option_id`, `option_name`, `option_value`, `autoload`) VALUES
(1, 'siteurl', 'http://localhost/WP-Blog', 'yes'),
(2, 'home', 'http://localhost/WP-Blog', 'yes'),
(3, 'blogname', 'Test WP project', 'yes'),
(4, 'blogdescription', '', 'yes'),
(5, 'users_can_register', '1', 'yes'),
(6, 'admin_email', 'gorbenkoartur.ur@gmail.com', 'yes'),
(7, 'start_of_week', '1', 'yes'),
(8, 'use_balanceTags', '0', 'yes'),
(9, 'use_smilies', '1', 'yes'),
(10, 'require_name_email', '1', 'yes'),
(11, 'comments_notify', '1', 'yes'),
(12, 'posts_per_rss', '10', 'yes'),
(13, 'rss_use_excerpt', '0', 'yes'),
(14, 'mailserver_url', 'mail.example.com', 'yes'),
(15, 'mailserver_login', 'login@example.com', 'yes'),
(16, 'mailserver_pass', 'password', 'yes'),
(17, 'mailserver_port', '110', 'yes'),
(18, 'default_category', '1', 'yes'),
(19, 'default_comment_status', 'open', 'yes'),
(20, 'default_ping_status', 'open', 'yes'),
(21, 'default_pingback_flag', '1', 'yes'),
(22, 'posts_per_page', '10', 'yes'),
(23, 'date_format', 'd.m.Y', 'yes'),
(24, 'time_format', 'H:i', 'yes'),
(25, 'links_updated_date_format', 'd.m.Y H:i', 'yes'),
(26, 'comment_moderation', '0', 'yes'),
(27, 'moderation_notify', '1', 'yes'),
(28, 'permalink_structure', '/%postname%/', 'yes'),
(29, 'rewrite_rules', 'a:109:{s:11:"^wp-json/?$";s:22:"index.php?rest_route=/";s:14:"^wp-json/(.*)?";s:33:"index.php?rest_route=/$matches[1]";s:21:"^index.php/wp-json/?$";s:22:"index.php?rest_route=/";s:24:"^index.php/wp-json/(.*)?";s:33:"index.php?rest_route=/$matches[1]";s:7:"news/?$";s:24:"index.php?post_type=news";s:37:"news/feed/(feed|rdf|rss|rss2|atom)/?$";s:41:"index.php?post_type=news&feed=$matches[1]";s:32:"news/(feed|rdf|rss|rss2|atom)/?$";s:41:"index.php?post_type=news&feed=$matches[1]";s:24:"news/page/([0-9]{1,})/?$";s:42:"index.php?post_type=news&paged=$matches[1]";s:47:"category/(.+?)/feed/(feed|rdf|rss|rss2|atom)/?$";s:52:"index.php?category_name=$matches[1]&feed=$matches[2]";s:42:"category/(.+?)/(feed|rdf|rss|rss2|atom)/?$";s:52:"index.php?category_name=$matches[1]&feed=$matches[2]";s:23:"category/(.+?)/embed/?$";s:46:"index.php?category_name=$matches[1]&embed=true";s:35:"category/(.+?)/page/?([0-9]{1,})/?$";s:53:"index.php?category_name=$matches[1]&paged=$matches[2]";s:17:"category/(.+?)/?$";s:35:"index.php?category_name=$matches[1]";s:44:"tag/([^/]+)/feed/(feed|rdf|rss|rss2|atom)/?$";s:42:"index.php?tag=$matches[1]&feed=$matches[2]";s:39:"tag/([^/]+)/(feed|rdf|rss|rss2|atom)/?$";s:42:"index.php?tag=$matches[1]&feed=$matches[2]";s:20:"tag/([^/]+)/embed/?$";s:36:"index.php?tag=$matches[1]&embed=true";s:32:"tag/([^/]+)/page/?([0-9]{1,})/?$";s:43:"index.php?tag=$matches[1]&paged=$matches[2]";s:14:"tag/([^/]+)/?$";s:25:"index.php?tag=$matches[1]";s:45:"type/([^/]+)/feed/(feed|rdf|rss|rss2|atom)/?$";s:50:"index.php?post_format=$matches[1]&feed=$matches[2]";s:40:"type/([^/]+)/(feed|rdf|rss|rss2|atom)/?$";s:50:"index.php?post_format=$matches[1]&feed=$matches[2]";s:21:"type/([^/]+)/embed/?$";s:44:"index.php?post_format=$matches[1]&embed=true";s:33:"type/([^/]+)/page/?([0-9]{1,})/?$";s:51:"index.php?post_format=$matches[1]&paged=$matches[2]";s:15:"type/([^/]+)/?$";s:33:"index.php?post_format=$matches[1]";s:32:"news/[^/]+/attachment/([^/]+)/?$";s:32:"index.php?attachment=$matches[1]";s:42:"news/[^/]+/attachment/([^/]+)/trackback/?$";s:37:"index.php?attachment=$matches[1]&tb=1";s:62:"news/[^/]+/attachment/([^/]+)/feed/(feed|rdf|rss|rss2|atom)/?$";s:49:"index.php?attachment=$matches[1]&feed=$matches[2]";s:57:"news/[^/]+/attachment/([^/]+)/(feed|rdf|rss|rss2|atom)/?$";s:49:"index.php?attachment=$matches[1]&feed=$matches[2]";s:57:"news/[^/]+/attachment/([^/]+)/comment-page-([0-9]{1,})/?$";s:50:"index.php?attachment=$matches[1]&cpage=$matches[2]";s:38:"news/[^/]+/attachment/([^/]+)/embed/?$";s:43:"index.php?attachment=$matches[1]&embed=true";s:21:"news/([^/]+)/embed/?$";s:37:"index.php?news=$matches[1]&embed=true";s:25:"news/([^/]+)/trackback/?$";s:31:"index.php?news=$matches[1]&tb=1";s:45:"news/([^/]+)/feed/(feed|rdf|rss|rss2|atom)/?$";s:43:"index.php?news=$matches[1]&feed=$matches[2]";s:40:"news/([^/]+)/(feed|rdf|rss|rss2|atom)/?$";s:43:"index.php?news=$matches[1]&feed=$matches[2]";s:33:"news/([^/]+)/page/?([0-9]{1,})/?$";s:44:"index.php?news=$matches[1]&paged=$matches[2]";s:40:"news/([^/]+)/comment-page-([0-9]{1,})/?$";s:44:"index.php?news=$matches[1]&cpage=$matches[2]";s:29:"news/([^/]+)(?:/([0-9]+))?/?$";s:43:"index.php?news=$matches[1]&page=$matches[2]";s:21:"news/[^/]+/([^/]+)/?$";s:32:"index.php?attachment=$matches[1]";s:31:"news/[^/]+/([^/]+)/trackback/?$";s:37:"index.php?attachment=$matches[1]&tb=1";s:51:"news/[^/]+/([^/]+)/feed/(feed|rdf|rss|rss2|atom)/?$";s:49:"index.php?attachment=$matches[1]&feed=$matches[2]";s:46:"news/[^/]+/([^/]+)/(feed|rdf|rss|rss2|atom)/?$";s:49:"index.php?attachment=$matches[1]&feed=$matches[2]";s:46:"news/[^/]+/([^/]+)/comment-page-([0-9]{1,})/?$";s:50:"index.php?attachment=$matches[1]&cpage=$matches[2]";s:27:"news/[^/]+/([^/]+)/embed/?$";s:43:"index.php?attachment=$matches[1]&embed=true";s:48:".*wp-(atom|rdf|rss|rss2|feed|commentsrss2)\\.php$";s:18:"index.php?feed=old";s:20:".*wp-app\\.php(/.*)?$";s:19:"index.php?error=403";s:18:".*wp-register.php$";s:23:"index.php?register=true";s:32:"feed/(feed|rdf|rss|rss2|atom)/?$";s:27:"index.php?&feed=$matches[1]";s:27:"(feed|rdf|rss|rss2|atom)/?$";s:27:"index.php?&feed=$matches[1]";s:8:"embed/?$";s:21:"index.php?&embed=true";s:20:"page/?([0-9]{1,})/?$";s:28:"index.php?&paged=$matches[1]";s:41:"comments/feed/(feed|rdf|rss|rss2|atom)/?$";s:42:"index.php?&feed=$matches[1]&withcomments=1";s:36:"comments/(feed|rdf|rss|rss2|atom)/?$";s:42:"index.php?&feed=$matches[1]&withcomments=1";s:17:"comments/embed/?$";s:21:"index.php?&embed=true";s:44:"search/(.+)/feed/(feed|rdf|rss|rss2|atom)/?$";s:40:"index.php?s=$matches[1]&feed=$matches[2]";s:39:"search/(.+)/(feed|rdf|rss|rss2|atom)/?$";s:40:"index.php?s=$matches[1]&feed=$matches[2]";s:20:"search/(.+)/embed/?$";s:34:"index.php?s=$matches[1]&embed=true";s:32:"search/(.+)/page/?([0-9]{1,})/?$";s:41:"index.php?s=$matches[1]&paged=$matches[2]";s:14:"search/(.+)/?$";s:23:"index.php?s=$matches[1]";s:47:"author/([^/]+)/feed/(feed|rdf|rss|rss2|atom)/?$";s:50:"index.php?author_name=$matches[1]&feed=$matches[2]";s:42:"author/([^/]+)/(feed|rdf|rss|rss2|atom)/?$";s:50:"index.php?author_name=$matches[1]&feed=$matches[2]";s:23:"author/([^/]+)/embed/?$";s:44:"index.php?author_name=$matches[1]&embed=true";s:35:"author/([^/]+)/page/?([0-9]{1,})/?$";s:51:"index.php?author_name=$matches[1]&paged=$matches[2]";s:17:"author/([^/]+)/?$";s:33:"index.php?author_name=$matches[1]";s:69:"([0-9]{4})/([0-9]{1,2})/([0-9]{1,2})/feed/(feed|rdf|rss|rss2|atom)/?$";s:80:"index.php?year=$matches[1]&monthnum=$matches[2]&day=$matches[3]&feed=$matches[4]";s:64:"([0-9]{4})/([0-9]{1,2})/([0-9]{1,2})/(feed|rdf|rss|rss2|atom)/?$";s:80:"index.php?year=$matches[1]&monthnum=$matches[2]&day=$matches[3]&feed=$matches[4]";s:45:"([0-9]{4})/([0-9]{1,2})/([0-9]{1,2})/embed/?$";s:74:"index.php?year=$matches[1]&monthnum=$matches[2]&day=$matches[3]&embed=true";s:57:"([0-9]{4})/([0-9]{1,2})/([0-9]{1,2})/page/?([0-9]{1,})/?$";s:81:"index.php?year=$matches[1]&monthnum=$matches[2]&day=$matches[3]&paged=$matches[4]";s:39:"([0-9]{4})/([0-9]{1,2})/([0-9]{1,2})/?$";s:63:"index.php?year=$matches[1]&monthnum=$matches[2]&day=$matches[3]";s:56:"([0-9]{4})/([0-9]{1,2})/feed/(feed|rdf|rss|rss2|atom)/?$";s:64:"index.php?year=$matches[1]&monthnum=$matches[2]&feed=$matches[3]";s:51:"([0-9]{4})/([0-9]{1,2})/(feed|rdf|rss|rss2|atom)/?$";s:64:"index.php?year=$matches[1]&monthnum=$matches[2]&feed=$matches[3]";s:32:"([0-9]{4})/([0-9]{1,2})/embed/?$";s:58:"index.php?year=$matches[1]&monthnum=$matches[2]&embed=true";s:44:"([0-9]{4})/([0-9]{1,2})/page/?([0-9]{1,})/?$";s:65:"index.php?year=$matches[1]&monthnum=$matches[2]&paged=$matches[3]";s:26:"([0-9]{4})/([0-9]{1,2})/?$";s:47:"index.php?year=$matches[1]&monthnum=$matches[2]";s:43:"([0-9]{4})/feed/(feed|rdf|rss|rss2|atom)/?$";s:43:"index.php?year=$matches[1]&feed=$matches[2]";s:38:"([0-9]{4})/(feed|rdf|rss|rss2|atom)/?$";s:43:"index.php?year=$matches[1]&feed=$matches[2]";s:19:"([0-9]{4})/embed/?$";s:37:"index.php?year=$matches[1]&embed=true";s:31:"([0-9]{4})/page/?([0-9]{1,})/?$";s:44:"index.php?year=$matches[1]&paged=$matches[2]";s:13:"([0-9]{4})/?$";s:26:"index.php?year=$matches[1]";s:27:".?.+?/attachment/([^/]+)/?$";s:32:"index.php?attachment=$matches[1]";s:37:".?.+?/attachment/([^/]+)/trackback/?$";s:37:"index.php?attachment=$matches[1]&tb=1";s:57:".?.+?/attachment/([^/]+)/feed/(feed|rdf|rss|rss2|atom)/?$";s:49:"index.php?attachment=$matches[1]&feed=$matches[2]";s:52:".?.+?/attachment/([^/]+)/(feed|rdf|rss|rss2|atom)/?$";s:49:"index.php?attachment=$matches[1]&feed=$matches[2]";s:52:".?.+?/attachment/([^/]+)/comment-page-([0-9]{1,})/?$";s:50:"index.php?attachment=$matches[1]&cpage=$matches[2]";s:33:".?.+?/attachment/([^/]+)/embed/?$";s:43:"index.php?attachment=$matches[1]&embed=true";s:16:"(.?.+?)/embed/?$";s:41:"index.php?pagename=$matches[1]&embed=true";s:20:"(.?.+?)/trackback/?$";s:35:"index.php?pagename=$matches[1]&tb=1";s:40:"(.?.+?)/feed/(feed|rdf|rss|rss2|atom)/?$";s:47:"index.php?pagename=$matches[1]&feed=$matches[2]";s:35:"(.?.+?)/(feed|rdf|rss|rss2|atom)/?$";s:47:"index.php?pagename=$matches[1]&feed=$matches[2]";s:28:"(.?.+?)/page/?([0-9]{1,})/?$";s:48:"index.php?pagename=$matches[1]&paged=$matches[2]";s:35:"(.?.+?)/comment-page-([0-9]{1,})/?$";s:48:"index.php?pagename=$matches[1]&cpage=$matches[2]";s:24:"(.?.+?)(?:/([0-9]+))?/?$";s:47:"index.php?pagename=$matches[1]&page=$matches[2]";s:27:"[^/]+/attachment/([^/]+)/?$";s:32:"index.php?attachment=$matches[1]";s:37:"[^/]+/attachment/([^/]+)/trackback/?$";s:37:"index.php?attachment=$matches[1]&tb=1";s:57:"[^/]+/attachment/([^/]+)/feed/(feed|rdf|rss|rss2|atom)/?$";s:49:"index.php?attachment=$matches[1]&feed=$matches[2]";s:52:"[^/]+/attachment/([^/]+)/(feed|rdf|rss|rss2|atom)/?$";s:49:"index.php?attachment=$matches[1]&feed=$matches[2]";s:52:"[^/]+/attachment/([^/]+)/comment-page-([0-9]{1,})/?$";s:50:"index.php?attachment=$matches[1]&cpage=$matches[2]";s:33:"[^/]+/attachment/([^/]+)/embed/?$";s:43:"index.php?attachment=$matches[1]&embed=true";s:16:"([^/]+)/embed/?$";s:37:"index.php?name=$matches[1]&embed=true";s:20:"([^/]+)/trackback/?$";s:31:"index.php?name=$matches[1]&tb=1";s:40:"([^/]+)/feed/(feed|rdf|rss|rss2|atom)/?$";s:43:"index.php?name=$matches[1]&feed=$matches[2]";s:35:"([^/]+)/(feed|rdf|rss|rss2|atom)/?$";s:43:"index.php?name=$matches[1]&feed=$matches[2]";s:28:"([^/]+)/page/?([0-9]{1,})/?$";s:44:"index.php?name=$matches[1]&paged=$matches[2]";s:35:"([^/]+)/comment-page-([0-9]{1,})/?$";s:44:"index.php?name=$matches[1]&cpage=$matches[2]";s:24:"([^/]+)(?:/([0-9]+))?/?$";s:43:"index.php?name=$matches[1]&page=$matches[2]";s:16:"[^/]+/([^/]+)/?$";s:32:"index.php?attachment=$matches[1]";s:26:"[^/]+/([^/]+)/trackback/?$";s:37:"index.php?attachment=$matches[1]&tb=1";s:46:"[^/]+/([^/]+)/feed/(feed|rdf|rss|rss2|atom)/?$";s:49:"index.php?attachment=$matches[1]&feed=$matches[2]";s:41:"[^/]+/([^/]+)/(feed|rdf|rss|rss2|atom)/?$";s:49:"index.php?attachment=$matches[1]&feed=$matches[2]";s:41:"[^/]+/([^/]+)/comment-page-([0-9]{1,})/?$";s:50:"index.php?attachment=$matches[1]&cpage=$matches[2]";s:22:"[^/]+/([^/]+)/embed/?$";s:43:"index.php?attachment=$matches[1]&embed=true";}', 'yes'),
(30, 'hack_file', '0', 'yes'),
(31, 'blog_charset', 'UTF-8', 'yes'),
(32, 'moderation_keys', '', 'no'),
(33, 'active_plugins', 'a:5:{i:0;s:31:"query-monitor/query-monitor.php";i:1;s:39:"Rest Api for CPT news/rest-api-news.php";i:2;s:47:"jwt-authentication-for-wp-rest-api/jwt-auth.php";i:3;s:29:"wp-mail-smtp/wp_mail_smtp.php";i:4;s:31:"wp-migrate-db/wp-migrate-db.php";}', 'yes'),
(34, 'category_base', '', 'yes'),
(35, 'ping_sites', 'http://rpc.pingomatic.com/', 'yes'),
(36, 'comment_max_links', '2', 'yes'),
(37, 'gmt_offset', '', 'yes'),
(38, 'default_email_category', '1', 'yes'),
(39, 'recently_edited', '', 'no'),
(40, 'template', 'twentysixteen', 'yes'),
(41, 'stylesheet', 'twentysixteen-child', 'yes'),
(42, 'comment_whitelist', '1', 'yes'),
(43, 'blacklist_keys', '', 'no'),
(44, 'comment_registration', '0', 'yes'),
(45, 'html_type', 'text/html', 'yes'),
(46, 'use_trackback', '0', 'yes'),
(47, 'default_role', 'author', 'yes'),
(48, 'db_version', '44719', 'yes'),
(49, 'uploads_use_yearmonth_folders', '1', 'yes'),
(50, 'upload_path', '', 'yes'),
(51, 'blog_public', '1', 'yes'),
(52, 'default_link_category', '2', 'yes'),
(53, 'show_on_front', 'posts', 'yes'),
(54, 'tag_base', '', 'yes'),
(55, 'show_avatars', '1', 'yes'),
(56, 'avatar_rating', 'G', 'yes'),
(57, 'upload_url_path', '', 'yes'),
(58, 'thumbnail_size_w', '150', 'yes'),
(59, 'thumbnail_size_h', '150', 'yes'),
(60, 'thumbnail_crop', '1', 'yes'),
(61, 'medium_size_w', '300', 'yes'),
(62, 'medium_size_h', '300', 'yes'),
(63, 'avatar_default', 'mystery', 'yes'),
(64, 'large_size_w', '1024', 'yes'),
(65, 'large_size_h', '1024', 'yes'),
(66, 'image_default_link_type', 'none', 'yes'),
(67, 'image_default_size', '', 'yes'),
(68, 'image_default_align', '', 'yes'),
(69, 'close_comments_for_old_posts', '0', 'yes'),
(70, 'close_comments_days_old', '14', 'yes'),
(71, 'thread_comments', '1', 'yes'),
(72, 'thread_comments_depth', '5', 'yes'),
(73, 'page_comments', '0', 'yes'),
(74, 'comments_per_page', '50', 'yes'),
(75, 'default_comments_page', 'newest', 'yes'),
(76, 'comment_order', 'asc', 'yes'),
(77, 'sticky_posts', 'a:0:{}', 'yes'),
(78, 'widget_categories', 'a:2:{i:2;a:4:{s:5:"title";s:0:"";s:5:"count";i:0;s:12:"hierarchical";i:0;s:8:"dropdown";i:0;}s:12:"_multiwidget";i:1;}', 'yes'),
(79, 'widget_text', 'a:2:{i:1;a:0:{}s:12:"_multiwidget";i:1;}', 'yes'),
(80, 'widget_rss', 'a:2:{i:1;a:0:{}s:12:"_multiwidget";i:1;}', 'yes'),
(81, 'uninstall_plugins', 'a:0:{}', 'no'),
(82, 'timezone_string', 'Europe/Kiev', 'yes'),
(83, 'page_for_posts', '0', 'yes'),
(84, 'page_on_front', '0', 'yes'),
(85, 'default_post_format', '0', 'yes'),
(86, 'link_manager_enabled', '0', 'yes'),
(87, 'finished_splitting_shared_terms', '1', 'yes'),
(88, 'site_icon', '0', 'yes'),
(89, 'medium_large_size_w', '768', 'yes'),
(90, 'medium_large_size_h', '0', 'yes'),
(91, 'wp_page_for_privacy_policy', '3', 'yes'),
(92, 'show_comments_cookies_opt_in', '1', 'yes'),
(93, 'initial_db_version', '44719', 'yes'),
(94, 'wp_user_roles', 'a:5:{s:13:"administrator";a:2:{s:4:"name";s:13:"Administrator";s:12:"capabilities";a:61:{s:13:"switch_themes";b:1;s:11:"edit_themes";b:1;s:16:"activate_plugins";b:1;s:12:"edit_plugins";b:1;s:10:"edit_users";b:1;s:10:"edit_files";b:1;s:14:"manage_options";b:1;s:17:"moderate_comments";b:1;s:17:"manage_categories";b:1;s:12:"manage_links";b:1;s:12:"upload_files";b:1;s:6:"import";b:1;s:15:"unfiltered_html";b:1;s:10:"edit_posts";b:1;s:17:"edit_others_posts";b:1;s:20:"edit_published_posts";b:1;s:13:"publish_posts";b:1;s:10:"edit_pages";b:1;s:4:"read";b:1;s:8:"level_10";b:1;s:7:"level_9";b:1;s:7:"level_8";b:1;s:7:"level_7";b:1;s:7:"level_6";b:1;s:7:"level_5";b:1;s:7:"level_4";b:1;s:7:"level_3";b:1;s:7:"level_2";b:1;s:7:"level_1";b:1;s:7:"level_0";b:1;s:17:"edit_others_pages";b:1;s:20:"edit_published_pages";b:1;s:13:"publish_pages";b:1;s:12:"delete_pages";b:1;s:19:"delete_others_pages";b:1;s:22:"delete_published_pages";b:1;s:12:"delete_posts";b:1;s:19:"delete_others_posts";b:1;s:22:"delete_published_posts";b:1;s:20:"delete_private_posts";b:1;s:18:"edit_private_posts";b:1;s:18:"read_private_posts";b:1;s:20:"delete_private_pages";b:1;s:18:"edit_private_pages";b:1;s:18:"read_private_pages";b:1;s:12:"delete_users";b:1;s:12:"create_users";b:1;s:17:"unfiltered_upload";b:1;s:14:"edit_dashboard";b:1;s:14:"update_plugins";b:1;s:14:"delete_plugins";b:1;s:15:"install_plugins";b:1;s:13:"update_themes";b:1;s:14:"install_themes";b:1;s:11:"update_core";b:1;s:10:"list_users";b:1;s:12:"remove_users";b:1;s:13:"promote_users";b:1;s:18:"edit_theme_options";b:1;s:13:"delete_themes";b:1;s:6:"export";b:1;}}s:6:"editor";a:2:{s:4:"name";s:6:"Editor";s:12:"capabilities";a:34:{s:17:"moderate_comments";b:1;s:17:"manage_categories";b:1;s:12:"manage_links";b:1;s:12:"upload_files";b:1;s:15:"unfiltered_html";b:1;s:10:"edit_posts";b:1;s:17:"edit_others_posts";b:1;s:20:"edit_published_posts";b:1;s:13:"publish_posts";b:1;s:10:"edit_pages";b:1;s:4:"read";b:1;s:7:"level_7";b:1;s:7:"level_6";b:1;s:7:"level_5";b:1;s:7:"level_4";b:1;s:7:"level_3";b:1;s:7:"level_2";b:1;s:7:"level_1";b:1;s:7:"level_0";b:1;s:17:"edit_others_pages";b:1;s:20:"edit_published_pages";b:1;s:13:"publish_pages";b:1;s:12:"delete_pages";b:1;s:19:"delete_others_pages";b:1;s:22:"delete_published_pages";b:1;s:12:"delete_posts";b:1;s:19:"delete_others_posts";b:1;s:22:"delete_published_posts";b:1;s:20:"delete_private_posts";b:1;s:18:"edit_private_posts";b:1;s:18:"read_private_posts";b:1;s:20:"delete_private_pages";b:1;s:18:"edit_private_pages";b:1;s:18:"read_private_pages";b:1;}}s:6:"author";a:2:{s:4:"name";s:6:"Author";s:12:"capabilities";a:10:{s:12:"upload_files";b:1;s:10:"edit_posts";b:1;s:20:"edit_published_posts";b:1;s:13:"publish_posts";b:1;s:4:"read";b:1;s:7:"level_2";b:1;s:7:"level_1";b:1;s:7:"level_0";b:1;s:12:"delete_posts";b:1;s:22:"delete_published_posts";b:1;}}s:11:"contributor";a:2:{s:4:"name";s:11:"Contributor";s:12:"capabilities";a:5:{s:10:"edit_posts";b:1;s:4:"read";b:1;s:7:"level_1";b:1;s:7:"level_0";b:1;s:12:"delete_posts";b:1;}}s:10:"subscriber";a:2:{s:4:"name";s:10:"Subscriber";s:12:"capabilities";a:2:{s:4:"read";b:1;s:7:"level_0";b:1;}}}', 'yes'),
(95, 'fresh_site', '0', 'yes'),
(96, 'WPLANG', '', 'yes'),
(97, 'widget_search', 'a:2:{i:2;a:1:{s:5:"title";s:0:"";}s:12:"_multiwidget";i:1;}', 'yes'),
(98, 'widget_recent-posts', 'a:2:{i:2;a:2:{s:5:"title";s:0:"";s:6:"number";i:5;}s:12:"_multiwidget";i:1;}', 'yes'),
(99, 'widget_recent-comments', 'a:2:{i:2;a:2:{s:5:"title";s:0:"";s:6:"number";i:5;}s:12:"_multiwidget";i:1;}', 'yes'),
(100, 'widget_archives', 'a:2:{i:2;a:3:{s:5:"title";s:0:"";s:5:"count";i:0;s:8:"dropdown";i:0;}s:12:"_multiwidget";i:1;}', 'yes') ;
INSERT INTO `wp_options` ( `option_id`, `option_name`, `option_value`, `autoload`) VALUES
(101, 'widget_meta', 'a:2:{i:2;a:1:{s:5:"title";s:0:"";}s:12:"_multiwidget";i:1;}', 'yes'),
(102, 'sidebars_widgets', 'a:5:{s:19:"wp_inactive_widgets";a:0:{}s:9:"sidebar-1";a:5:{i:0;s:8:"search-2";i:1;s:14:"recent-posts-2";i:2;s:17:"recent-comments-2";i:3;s:10:"archives-2";i:4;s:6:"meta-2";}s:9:"sidebar-2";a:0:{}s:9:"sidebar-3";a:0:{}s:13:"array_version";i:3;}', 'yes'),
(103, 'cron', 'a:7:{i:1574024019;a:1:{s:33:"wp-rest-api-log-purge-old-records";a:1:{s:32:"40cd750bba9870f18aada2478b24840a";a:3:{s:8:"schedule";s:6:"hourly";s:4:"args";a:0:{}s:8:"interval";i:3600;}}}i:1574025677;a:1:{s:34:"wp_privacy_delete_old_export_files";a:1:{s:32:"40cd750bba9870f18aada2478b24840a";a:3:{s:8:"schedule";s:6:"hourly";s:4:"args";a:0:{}s:8:"interval";i:3600;}}}i:1574029277;a:3:{s:16:"wp_version_check";a:1:{s:32:"40cd750bba9870f18aada2478b24840a";a:3:{s:8:"schedule";s:10:"twicedaily";s:4:"args";a:0:{}s:8:"interval";i:43200;}}s:17:"wp_update_plugins";a:1:{s:32:"40cd750bba9870f18aada2478b24840a";a:3:{s:8:"schedule";s:10:"twicedaily";s:4:"args";a:0:{}s:8:"interval";i:43200;}}s:16:"wp_update_themes";a:1:{s:32:"40cd750bba9870f18aada2478b24840a";a:3:{s:8:"schedule";s:10:"twicedaily";s:4:"args";a:0:{}s:8:"interval";i:43200;}}}i:1574072477;a:1:{s:32:"recovery_mode_clean_expired_keys";a:1:{s:32:"40cd750bba9870f18aada2478b24840a";a:3:{s:8:"schedule";s:5:"daily";s:4:"args";a:0:{}s:8:"interval";i:86400;}}}i:1574072485;a:2:{s:19:"wp_scheduled_delete";a:1:{s:32:"40cd750bba9870f18aada2478b24840a";a:3:{s:8:"schedule";s:5:"daily";s:4:"args";a:0:{}s:8:"interval";i:86400;}}s:25:"delete_expired_transients";a:1:{s:32:"40cd750bba9870f18aada2478b24840a";a:3:{s:8:"schedule";s:5:"daily";s:4:"args";a:0:{}s:8:"interval";i:86400;}}}i:1574072486;a:1:{s:30:"wp_scheduled_auto_draft_delete";a:1:{s:32:"40cd750bba9870f18aada2478b24840a";a:3:{s:8:"schedule";s:5:"daily";s:4:"args";a:0:{}s:8:"interval";i:86400;}}}s:7:"version";i:2;}', 'yes'),
(104, 'widget_pages', 'a:1:{s:12:"_multiwidget";i:1;}', 'yes'),
(105, 'widget_calendar', 'a:1:{s:12:"_multiwidget";i:1;}', 'yes'),
(106, 'widget_media_audio', 'a:1:{s:12:"_multiwidget";i:1;}', 'yes'),
(107, 'widget_media_image', 'a:1:{s:12:"_multiwidget";i:1;}', 'yes'),
(108, 'widget_media_gallery', 'a:1:{s:12:"_multiwidget";i:1;}', 'yes'),
(109, 'widget_media_video', 'a:1:{s:12:"_multiwidget";i:1;}', 'yes'),
(110, 'widget_tag_cloud', 'a:1:{s:12:"_multiwidget";i:1;}', 'yes'),
(111, 'widget_nav_menu', 'a:1:{s:12:"_multiwidget";i:1;}', 'yes'),
(112, 'widget_custom_html', 'a:1:{s:12:"_multiwidget";i:1;}', 'yes'),
(114, 'recovery_keys', 'a:0:{}', 'yes'),
(117, 'theme_mods_twentynineteen', 'a:2:{s:18:"custom_css_post_id";i:-1;s:16:"sidebars_widgets";a:2:{s:4:"time";i:1572776610;s:4:"data";a:2:{s:19:"wp_inactive_widgets";a:0:{}s:9:"sidebar-1";a:6:{i:0;s:8:"search-2";i:1;s:14:"recent-posts-2";i:2;s:17:"recent-comments-2";i:3;s:10:"archives-2";i:4;s:12:"categories-2";i:5;s:6:"meta-2";}}}}', 'yes'),
(137, 'can_compress_scripts', '1', 'no'),
(146, 'new_admin_email', 'gorbenkoartur.ur@gmail.com', 'yes'),
(154, 'recently_activated', 'a:5:{s:35:"wp-rest-api-log/wp-rest-api-log.php";i:1573890145;s:25:"WP-API-develop/plugin.php";i:1573675611;s:35:"ultimate-member/ultimate-member.php";i:1573498804;s:29:"easy-wp-smtp/easy-wp-smtp.php";i:1573495663;s:27:"check-email/check-email.php";i:1573494698;}', 'yes'),
(155, 'current_theme', 'Twenty Sixteen Child', 'yes'),
(156, 'theme_mods_customtwentysixteen', 'a:4:{i:0;b:0;s:18:"nav_menu_locations";a:1:{s:7:"primary";i:2;}s:18:"custom_css_post_id";i:-1;s:16:"sidebars_widgets";a:2:{s:4:"time";i:1573845115;s:4:"data";a:4:{s:19:"wp_inactive_widgets";a:0:{}s:9:"sidebar-1";a:6:{i:0;s:8:"search-2";i:1;s:14:"recent-posts-2";i:2;s:17:"recent-comments-2";i:3;s:10:"archives-2";i:4;s:12:"categories-2";i:5;s:6:"meta-2";}s:9:"sidebar-2";a:0:{}s:9:"sidebar-3";a:0:{}}}}', 'yes'),
(157, 'theme_switched', '', 'yes'),
(164, 'nav_menu_options', 'a:1:{s:8:"auto_add";a:0:{}}', 'yes'),
(180, 'recovery_mode_email_last_sent', '1573804003', 'yes'),
(235, 'lhr_version', '1.0.4', 'yes'),
(239, 'wp-rest-api-log-settings-general', 'a:3:{s:15:"logging-enabled";s:1:"1";s:10:"purge-days";i:7;s:18:"ip-address-display";s:10:"ip_address";}', 'no'),
(240, 'wp-rest-api-log-settings-routes', 'a:3:{s:18:"ignore-core-oembed";s:1:"1";s:23:"route-log-matching-mode";s:0:"";s:13:"route-filters";s:0:"";}', 'no'),
(461, 'wp_mail_smtp_initial_version', '1.7.1', 'no'),
(462, 'wp_mail_smtp_version', '1.7.1', 'no'),
(463, 'wp_mail_smtp', 'a:6:{s:4:"mail";a:6:{s:10:"from_email";s:26:"gorbenkoartur.ur@gmail.com";s:9:"from_name";s:9:"ArturBlog";s:6:"mailer";s:5:"gmail";s:11:"return_path";b:0;s:16:"from_email_force";b:0;s:15:"from_name_force";b:1;}s:4:"smtp";a:7:{s:7:"autotls";s:3:"yes";s:4:"auth";s:3:"yes";s:4:"host";s:0:"";s:10:"encryption";s:4:"none";s:4:"port";s:0:"";s:4:"user";s:0:"";s:4:"pass";s:0:"";}s:10:"sendinblue";a:1:{s:7:"api_key";s:0:"";}s:7:"mailgun";a:3:{s:7:"api_key";s:0:"";s:6:"domain";s:0:"";s:6:"region";s:2:"US";}s:8:"sendgrid";a:1:{s:7:"api_key";s:0:"";}s:5:"gmail";a:5:{s:9:"client_id";s:72:"661038693893-se7oo0seg59kv91kesalk55jdkc71975.apps.googleusercontent.com";s:13:"client_secret";s:24:"4DGQcXMzzH9VjV_33FznwtZC";s:9:"auth_code";s:89:"4/tAHByPMOPn5EvujeoWWEzCPAgOdG8NiLfmKFCWFzsTD5LDY_K3PA5SvYoC61Tj9qzbkyRQZsHCy6tO29jq1TsKg";s:12:"access_token";a:6:{s:12:"access_token";s:136:"ya29.ImCxB3a1_LJI7BZbKHE7ToNK2nTn1nHxet-6WU75J53p7AS6HaYduFwejPwO5PZgHs1dIKae3hMdbXwCFs1c-ZenXItKDeOHksyyj4smYPxZTR3Cqlw_6AXz9bwx6zs1Fog";s:10:"expires_in";i:3600;s:5:"scope";s:24:"https://mail.google.com/";s:10:"token_type";s:6:"Bearer";s:7:"created";i:1574020433;s:13:"refresh_token";s:103:"1//0c_F0EncgrqXqCgYIARAAGAwSNwF-L9IrkFK4CHu4Meo1MaCQQJRcPwVrzZKMaoHMMizdbeBX5OuGUvzkEzIQxBSny_PlUjNZLOw";}s:13:"refresh_token";s:103:"1//0c_F0EncgrqXqCgYIARAAGAwSNwF-L9IrkFK4CHu4Meo1MaCQQJRcPwVrzZKMaoHMMizdbeBX5OuGUvzkEzIQxBSny_PlUjNZLOw";}}', 'no'),
(464, 'wp_mail_smtp_debug', 'a:0:{}', 'no'),
(469, 'swpsmtp_options', 'a:8:{s:16:"from_email_field";s:23:"gorbenkoartur@gmail.com";s:15:"from_name_field";s:6:"Arthur";s:23:"force_from_name_replace";b:0;s:13:"smtp_settings";a:9:{s:4:"host";s:14:"smtp.gmail.com";s:15:"type_encryption";s:3:"ssl";s:4:"port";s:3:"587";s:13:"autentication";s:2:"no";s:8:"username";s:9:"ArchiBald";s:8:"password";s:12:"RGpLYjE5OTY=";s:12:"enable_debug";i:1;s:12:"insecure_ssl";i:1;s:12:"encrypt_pass";b:0;}s:15:"allowed_domains";s:12:"bG9jYWxob3N0";s:14:"reply_to_email";s:0:"";s:17:"email_ignore_list";s:0:"";s:19:"enable_domain_check";b:0;}', 'yes'),
(470, 'smtp_test_mail', 'a:3:{s:10:"swpsmtp_to";s:18:"archik96@gmail.com";s:15:"swpsmtp_subject";s:6:"asdasd";s:15:"swpsmtp_message";s:9:"asdasdads";}', 'yes'),
(482, 'um_last_version_upgrade', '2.1.0', 'yes'),
(483, 'um_first_activation_date', '1573498761', 'yes'),
(484, 'um_version', '2.1.0', 'yes'),
(485, '__ultimatemember_sitekey', 'localhost/wordpress-aFuCpKOorQtmrIAdjDJO', 'yes'),
(486, 'um_is_installed', '1', 'yes'),
(487, 'um_core_forms', 'a:3:{s:8:"register";i:384;s:5:"login";i:385;s:7:"profile";i:386;}', 'yes'),
(488, 'um_core_directories', 'a:1:{s:7:"members";i:387;}', 'yes'),
(489, 'um_options', 'a:161:{s:30:"restricted_access_post_metabox";a:2:{s:4:"post";i:1;s:4:"page";i:1;}s:19:"uninstall_on_delete";i:0;s:14:"permalink_base";s:10:"user_login";s:12:"display_name";s:9:"full_name";s:18:"display_name_field";s:0:"";s:15:"author_redirect";i:1;s:12:"members_page";i:1;s:13:"use_gravatars";i:0;s:37:"use_um_gravatar_default_builtin_image";s:7:"default";s:29:"use_um_gravatar_default_image";i:0;s:24:"reset_require_strongpass";i:0;s:20:"account_tab_password";i:1;s:19:"account_tab_privacy";i:1;s:25:"account_tab_notifications";i:1;s:18:"account_tab_delete";i:1;s:19:"delete_account_text";s:150:"Are you sure you want to delete your account? This will erase all of your account data from the site. To delete your account enter your password below";s:12:"account_name";i:1;s:20:"account_name_disable";i:0;s:20:"account_name_require";i:1;s:13:"account_email";i:1;s:24:"account_general_password";i:0;s:25:"account_hide_in_directory";i:1;s:26:"account_require_strongpass";i:0;s:17:"photo_thumb_sizes";a:3:{i:0;i:40;i:1;i:80;i:2;i:190;}s:17:"cover_thumb_sizes";a:2:{i:0;i:300;i:1;i:600;}s:10:"accessible";i:0;s:15:"access_redirect";s:0:"";s:19:"access_exclude_uris";a:0:{}s:20:"home_page_accessible";i:1;s:24:"category_page_accessible";i:1;s:25:"restricted_access_message";s:0:"";s:17:"restricted_blocks";i:0;s:13:"enable_blocks";i:0;s:24:"restricted_block_message";s:0:"";s:27:"enable_reset_password_limit";i:1;s:27:"reset_password_limit_number";i:3;s:14:"blocked_emails";s:0:"";s:13:"blocked_words";s:47:"admin\r\nadministrator\r\nwebmaster\r\nsupport\r\nstaff";s:14:"default_avatar";s:0:"";s:13:"default_cover";s:0:"";s:28:"disable_profile_photo_upload";i:0;s:21:"profile_show_metaicon";i:0;s:12:"profile_menu";i:1;s:24:"profile_menu_default_tab";s:4:"main";s:18:"profile_menu_icons";i:1;s:13:"form_asterisk";i:0;s:13:"profile_title";s:28:"{display_name} | {site_name}";s:12:"profile_desc";s:83:"{display_name} is on {site_name}. Join {site_name} to view {display_name}\'s profile";s:11:"admin_email";s:26:"gorbenkoartur.ur@gmail.com";s:9:"mail_from";s:9:"ArturBlog";s:14:"mail_from_addr";s:26:"gorbenkoartur.ur@gmail.com";s:10:"email_html";i:1;s:17:"image_compression";i:60;s:15:"image_max_width";i:1000;s:15:"cover_min_width";i:1000;s:22:"profile_photo_max_size";i:999999999;s:20:"cover_photo_max_size";i:999999999;s:22:"custom_roles_increment";i:1;s:28:"um_profile_object_cache_stop";i:0;s:16:"rest_api_version";s:3:"2.0";s:21:"profile_show_html_bio";i:0;s:16:"profile_tab_main";i:1;s:24:"profile_tab_main_privacy";i:0;s:22:"profile_tab_main_roles";s:0:"";s:17:"profile_tab_posts";i:1;s:25:"profile_tab_posts_privacy";i:0;s:23:"profile_tab_posts_roles";s:0:"";s:20:"profile_tab_comments";i:1;s:28:"profile_tab_comments_privacy";i:0;s:26:"profile_tab_comments_roles";s:0:"";s:16:"welcome_email_on";b:1;s:17:"welcome_email_sub";s:23:"Welcome to {site_name}!";s:13:"welcome_email";s:365:"Hi {display_name},<br /><br />Thank you for signing up with {site_name}! Your account is now active.<br /><br />To login please visit the following url:<br /><br />{login_url} <br /><br />Your account e-mail: {email} <br />Your account username: {username} <br /><br />If you have any problems, please contact us at {admin_email}<br /><br />Thanks,<br />{site_name}";s:18:"checkmail_email_on";b:0;s:19:"checkmail_email_sub";s:28:"Please activate your account";s:15:"checkmail_email";s:304:"Hi {display_name},<br /><br />Thank you for signing up with {site_name}! To activate your account, please click the link below to confirm your email address:<br /><br />{account_activation_link} <br /><br />If you have any problems, please contact us at {admin_email}<br /><br />Thanks, <br />{site_name}";s:16:"pending_email_on";b:0;s:17:"pending_email_sub";s:30:"[{site_name}] New user account";s:13:"pending_email";s:309:"Hi {display_name}, <br /><br />Thank you for signing up with {site_name}! Your account is currently being reviewed by a member of our team.<br /><br />Please allow us some time to process your request.<br /><br />If you have any problems, please contact us at {admin_email}<br /><br />Thanks,<br />{site_name}";s:17:"approved_email_on";b:0;s:18:"approved_email_sub";s:41:"Your account at {site_name} is now active";s:14:"approved_email";s:438:"Hi {display_name},<br /><br />Thank you for signing up with {site_name}! Your account has been approved and is now active.<br /><br />To login please visit the following url:<br /><br />{login_url}<br /><br />Your account e-mail: {email}<br />Your account username: {username}<br />Set your account password: {password_reset_link}<br /><br />If you have any problems, please contact us at {admin_email}<br /><br />Thanks,<br />{site_name}";s:17:"rejected_email_on";b:0;s:18:"rejected_email_sub";s:30:"Your account has been rejected";s:14:"rejected_email";s:288:"Hi {display_name},<br /><br />Thank you for applying for membership to {site_name}! We have reviewed your information and unfortunately we are unable to accept you as a member at this moment.<br /><br />Please feel free to apply again at a future date.<br /><br />Thanks,<br />{site_name}";s:17:"inactive_email_on";b:1;s:18:"inactive_email_sub";s:33:"Your account has been deactivated";s:14:"inactive_email";s:250:"Hi {display_name},<br /><br />This is an automated email to let you know your {site_name} account has been deactivated.<br /><br />If you would like your account to be reactivated please contact us at {admin_email}<br /><br />Thanks,<br />{site_name}";s:17:"deletion_email_on";b:1;s:18:"deletion_email_sub";s:29:"Your account has been deleted";s:14:"deletion_email";s:355:"Hi {display_name},<br /><br />This is an automated email to let you know your {site_name} account has been deleted. All of your personal information has been permanently deleted and you will no longer be able to login to {site_name}.<br /><br />If your account has been deleted by accident please contact us at {admin_email} <br />Thanks,<br />{site_name}";s:16:"resetpw_email_on";b:1;s:17:"resetpw_email_sub";s:19:"Reset your password";s:13:"resetpw_email";s:303:"Hi {display_name},<br /><br />We received a request to reset the password for your account. If you made this request, click the link below to change your password:<br /><br />{password_reset_link}<br /><br />If you didn\'t make this request, you can ignore this email <br /><br />Thanks,<br />{site_name}";s:18:"changedpw_email_on";b:1;s:19:"changedpw_email_sub";s:42:"Your {site_name} password has been changed";s:15:"changedpw_email";s:307:"Hi {display_name},<br /><br />You recently changed the password associated with your {site_name} account.<br /><br />If you did not make this change and believe your {site_name} account has been compromised, please contact us at the following email address: {admin_email}<br /><br />Thanks,<br />{site_name}";s:23:"changedaccount_email_on";b:1;s:24:"changedaccount_email_sub";s:39:"Your account at {site_name} was updated";s:20:"changedaccount_email";s:278:"Hi {display_name},<br /><br />You recently updated your {site_name} account.<br /><br />If you did not make this change and believe your {site_name} account has been compromised, please contact us at the following email address: {admin_email}<br /><br />Thanks,<br />{site_name}";s:24:"notification_new_user_on";b:1;s:25:"notification_new_user_sub";s:30:"[{site_name}] New user account";s:21:"notification_new_user";s:211:"{display_name} has just created an account on {site_name}. To view their profile click here:<br /><br />{user_profile_link}<br /><br />Here is the submitted registration form:<br /><br />{submitted_registration}";s:22:"notification_review_on";b:0;s:23:"notification_review_sub";s:38:"[{site_name}] New user awaiting review";s:19:"notification_review";s:277:"{display_name} has just applied for membership to {site_name} and is waiting to be reviewed.<br /><br />To review this member please click the following link:<br /><br />{user_profile_link}<br /><br />Here is the submitted registration form:<br /><br />{submitted_registration}";s:24:"notification_deletion_on";b:0;s:25:"notification_deletion_sub";s:29:"[{site_name}] Account deleted";s:21:"notification_deletion";s:58:"{display_name} has just deleted their {site_name} account.";s:9:"core_user";s:0:"";s:10:"core_login";s:0:"";s:13:"core_register";s:0:"";s:12:"core_members";s:0:"";s:11:"core_logout";s:0:"";s:12:"core_account";s:0:"";s:19:"core_password-reset";s:0:"";s:17:"profile_show_name";i:1;s:25:"profile_show_social_links";i:0;s:16:"profile_show_bio";i:1;s:20:"profile_bio_maxchars";i:180;s:19:"profile_header_menu";s:2:"bc";s:18:"profile_empty_text";i:1;s:22:"profile_empty_text_emo";i:1;s:12:"profile_role";a:0:{}s:16:"profile_template";s:7:"profile";s:17:"profile_max_width";s:6:"1000px";s:22:"profile_area_max_width";s:5:"600px";s:13:"profile_align";s:6:"center";s:13:"profile_icons";s:5:"label";s:28:"profile_disable_photo_upload";i:0;s:17:"profile_photosize";s:3:"190";s:21:"profile_cover_enabled";i:1;s:17:"profile_coversize";s:8:"original";s:19:"profile_cover_ratio";s:5:"2.7:1";s:19:"profile_photocorner";s:1:"1";s:17:"profile_header_bg";s:0:"";s:24:"profile_primary_btn_word";s:14:"Update Profile";s:21:"profile_secondary_btn";s:1:"1";s:26:"profile_secondary_btn_word";s:6:"Cancel";s:13:"register_role";s:1:"0";s:17:"register_template";s:8:"register";s:18:"register_max_width";s:5:"450px";s:14:"register_align";s:6:"center";s:14:"register_icons";s:5:"label";s:25:"register_primary_btn_word";s:8:"Register";s:22:"register_secondary_btn";i:1;s:27:"register_secondary_btn_word";s:5:"Login";s:26:"register_secondary_btn_url";s:0:"";s:14:"login_template";s:5:"login";s:15:"login_max_width";s:5:"450px";s:11:"login_align";s:6:"center";s:11:"login_icons";s:5:"label";s:22:"login_primary_btn_word";s:5:"Login";s:22:"login_forgot_pass_link";i:1;s:21:"login_show_rememberme";i:1;s:19:"login_secondary_btn";i:1;s:24:"login_secondary_btn_word";s:8:"Register";s:23:"login_secondary_btn_url";s:0:"";s:18:"directory_template";s:7:"members";s:16:"directory_header";s:21:"{total_users} Members";s:23:"directory_header_single";s:20:"{total_users} Member";}', 'yes'),
(490, 'um_role_subscriber_meta', 'a:14:{s:22:"_um_can_access_wpadmin";i:0;s:24:"_um_can_not_see_adminbar";i:1;s:21:"_um_can_edit_everyone";i:0;s:23:"_um_can_delete_everyone";i:0;s:20:"_um_can_edit_profile";i:1;s:22:"_um_can_delete_profile";i:1;s:15:"_um_after_login";s:16:"redirect_profile";s:16:"_um_after_logout";s:13:"redirect_home";s:20:"_um_default_homepage";i:1;s:16:"_um_can_view_all";i:1;s:28:"_um_can_make_private_profile";i:0;s:30:"_um_can_access_private_profile";i:0;s:10:"_um_status";s:8:"approved";s:20:"_um_auto_approve_act";s:16:"redirect_profile";}', 'yes'),
(491, 'um_role_author_meta', 'a:14:{s:22:"_um_can_access_wpadmin";i:0;s:24:"_um_can_not_see_adminbar";i:1;s:21:"_um_can_edit_everyone";i:0;s:23:"_um_can_delete_everyone";i:0;s:20:"_um_can_edit_profile";i:1;s:22:"_um_can_delete_profile";i:1;s:15:"_um_after_login";s:16:"redirect_profile";s:16:"_um_after_logout";s:13:"redirect_home";s:20:"_um_default_homepage";i:1;s:16:"_um_can_view_all";i:1;s:28:"_um_can_make_private_profile";i:0;s:30:"_um_can_access_private_profile";i:0;s:10:"_um_status";s:8:"approved";s:20:"_um_auto_approve_act";s:16:"redirect_profile";}', 'yes'),
(492, 'um_role_contributor_meta', 'a:14:{s:22:"_um_can_access_wpadmin";i:0;s:24:"_um_can_not_see_adminbar";i:1;s:21:"_um_can_edit_everyone";i:0;s:23:"_um_can_delete_everyone";i:0;s:20:"_um_can_edit_profile";i:1;s:22:"_um_can_delete_profile";i:1;s:15:"_um_after_login";s:16:"redirect_profile";s:16:"_um_after_logout";s:13:"redirect_home";s:20:"_um_default_homepage";i:1;s:16:"_um_can_view_all";i:1;s:28:"_um_can_make_private_profile";i:0;s:30:"_um_can_access_private_profile";i:0;s:10:"_um_status";s:8:"approved";s:20:"_um_auto_approve_act";s:16:"redirect_profile";}', 'yes'),
(493, 'um_role_editor_meta', 'a:14:{s:22:"_um_can_access_wpadmin";i:0;s:24:"_um_can_not_see_adminbar";i:1;s:21:"_um_can_edit_everyone";i:0;s:23:"_um_can_delete_everyone";i:0;s:20:"_um_can_edit_profile";i:1;s:22:"_um_can_delete_profile";i:1;s:15:"_um_after_login";s:16:"redirect_profile";s:16:"_um_after_logout";s:13:"redirect_home";s:20:"_um_default_homepage";i:1;s:16:"_um_can_view_all";i:1;s:28:"_um_can_make_private_profile";i:0;s:30:"_um_can_access_private_profile";i:0;s:10:"_um_status";s:8:"approved";s:20:"_um_auto_approve_act";s:16:"redirect_profile";}', 'yes'),
(494, 'um_role_administrator_meta', 'a:14:{s:22:"_um_can_access_wpadmin";i:1;s:24:"_um_can_not_see_adminbar";i:0;s:21:"_um_can_edit_everyone";i:1;s:23:"_um_can_delete_everyone";i:1;s:20:"_um_can_edit_profile";i:1;s:22:"_um_can_delete_profile";i:1;s:20:"_um_default_homepage";i:1;s:15:"_um_after_login";s:14:"redirect_admin";s:16:"_um_after_logout";s:13:"redirect_home";s:16:"_um_can_view_all";i:1;s:28:"_um_can_make_private_profile";i:1;s:30:"_um_can_access_private_profile";i:1;s:10:"_um_status";s:8:"approved";s:20:"_um_auto_approve_act";s:16:"redirect_profile";}', 'yes'),
(495, 'widget_um_search_widget', 'a:1:{s:12:"_multiwidget";i:1;}', 'yes'),
(496, 'um_cache_userdata_1', 'a:96:{s:2:"ID";i:1;s:10:"user_login";s:6:"Arthur";s:9:"user_pass";s:34:"$P$Bb4k3fm9cEl.EBtAw2k3/DN9uciUxQ.";s:13:"user_nicename";s:6:"arthur";s:10:"user_email";s:26:"gorbenkoartur.ur@gmail.com";s:8:"user_url";s:0:"";s:15:"user_registered";s:19:"2019-11-03 10:21:16";s:11:"user_status";s:1:"0";s:12:"display_name";s:6:"Arthur";s:13:"administrator";b:1;s:8:"wp_roles";s:13:"administrator";s:13:"switch_themes";b:1;s:11:"edit_themes";b:1;s:16:"activate_plugins";b:1;s:12:"edit_plugins";b:1;s:10:"edit_users";b:1;s:10:"edit_files";b:1;s:14:"manage_options";b:1;s:17:"moderate_comments";b:1;s:17:"manage_categories";b:1;s:12:"manage_links";b:1;s:12:"upload_files";b:1;s:6:"import";b:1;s:15:"unfiltered_html";b:1;s:10:"edit_posts";b:1;s:17:"edit_others_posts";b:1;s:20:"edit_published_posts";b:1;s:13:"publish_posts";b:1;s:10:"edit_pages";b:1;s:4:"read";b:1;s:17:"edit_others_pages";b:1;s:20:"edit_published_pages";b:1;s:13:"publish_pages";b:1;s:12:"delete_pages";b:1;s:19:"delete_others_pages";b:1;s:22:"delete_published_pages";b:1;s:12:"delete_posts";b:1;s:19:"delete_others_posts";b:1;s:22:"delete_published_posts";b:1;s:20:"delete_private_posts";b:1;s:18:"edit_private_posts";b:1;s:18:"read_private_posts";b:1;s:20:"delete_private_pages";b:1;s:18:"edit_private_pages";b:1;s:18:"read_private_pages";b:1;s:12:"delete_users";b:1;s:12:"create_users";b:1;s:17:"unfiltered_upload";b:1;s:14:"edit_dashboard";b:1;s:14:"update_plugins";b:1;s:14:"delete_plugins";b:1;s:15:"install_plugins";b:1;s:13:"update_themes";b:1;s:14:"install_themes";b:1;s:11:"update_core";b:1;s:10:"list_users";b:1;s:12:"remove_users";b:1;s:13:"promote_users";b:1;s:18:"edit_theme_options";b:1;s:13:"delete_themes";b:1;s:6:"export";b:1;s:6:"filter";N;s:16:"\0WP_User\0site_id";i:1;s:8:"nickname";s:6:"Arthur";s:10:"first_name";s:0:"";s:9:"last_name";s:0:"";s:11:"description";s:0:"";s:12:"rich_editing";s:4:"true";s:19:"syntax_highlighting";s:4:"true";s:17:"comment_shortcuts";s:5:"false";s:11:"admin_color";s:5:"fresh";s:7:"use_ssl";s:1:"0";s:20:"show_admin_bar_front";s:4:"true";s:6:"locale";s:0:"";s:18:"show_welcome_panel";s:1:"1";s:37:"wp_dashboard_quick_press_last_post_id";s:3:"382";s:29:"edit_wp-rest-api-log_per_page";s:3:"100";s:14:"account_status";s:8:"approved";s:19:"account_status_name";s:8:"Approved";s:4:"role";s:13:"administrator";s:5:"roles";a:1:{i:0;s:13:"administrator";}s:18:"can_access_wpadmin";i:1;s:20:"can_not_see_adminbar";i:0;s:17:"can_edit_everyone";i:1;s:19:"can_delete_everyone";i:1;s:16:"can_edit_profile";i:1;s:18:"can_delete_profile";i:1;s:16:"default_homepage";i:1;s:11:"after_login";s:14:"redirect_admin";s:12:"after_logout";s:13:"redirect_home";s:12:"can_view_all";i:1;s:24:"can_make_private_profile";i:1;s:26:"can_access_private_profile";i:1;s:6:"status";s:8:"approved";s:16:"auto_approve_act";s:16:"redirect_profile";s:11:"super_admin";i:1;}', 'no'),
(499, 'um_cached_users_queue', '0', 'no'),
(563, 'mo_api_authentication_selected_authentication_method', 'jwt_auth', 'yes'),
(564, 'mo_api_authentication_config_settings_jwt_auth', '1', 'yes'),
(565, 'mo_api_authentication_jwt_client_secret', 'DjKb1996', 'yes'),
(566, 'mo_api_authentication_jwt_signing_algorithm', 'HS256', 'yes'),
(576, 'mo_api_auth_message', 'Plugin deactivated successfully', 'yes'),
(715, 'theme_mods_twentysixteen-child', 'a:4:{i:0;b:0;s:18:"nav_menu_locations";a:1:{s:7:"primary";i:2;}s:18:"custom_css_post_id";i:-1;s:16:"header_textcolor";s:6:"1a1a1a";}', 'yes'),
(766, 'wpmdb_usage', 'a:2:{s:6:"action";s:8:"savefile";s:4:"time";i:1574023175;}', 'no'),
(893, 'category_children', 'a:0:{}', 'yes') ;

#
# End of data contents of table `wp_options`
# --------------------------------------------------------



#
# Delete any existing table `wp_postmeta`
#

DROP TABLE IF EXISTS `wp_postmeta`;


#
# Table structure of table `wp_postmeta`
#

CREATE TABLE `wp_postmeta` (
  `meta_id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `post_id` bigint(20) unsigned NOT NULL DEFAULT 0,
  `meta_key` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `meta_value` longtext COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`meta_id`),
  KEY `post_id` (`post_id`),
  KEY `meta_key` (`meta_key`(191))
) ENGINE=InnoDB AUTO_INCREMENT=32299 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;


#
# Data contents of table `wp_postmeta`
#
INSERT INTO `wp_postmeta` ( `meta_id`, `post_id`, `meta_key`, `meta_value`) VALUES
(11, 7, '_menu_item_type', 'post_type_archive'),
(12, 7, '_menu_item_menu_item_parent', '0'),
(13, 7, '_menu_item_object_id', '0'),
(14, 7, '_menu_item_object', 'news'),
(15, 7, '_menu_item_target', ''),
(16, 7, '_menu_item_classes', 'a:1:{i:0;s:0:"";}'),
(17, 7, '_menu_item_xfn', ''),
(18, 7, '_menu_item_url', ''),
(19, 5, '_wp_trash_meta_status', 'publish'),
(20, 5, '_wp_trash_meta_time', '1572776751'),
(21, 8, '_edit_lock', '1574021231:1'),
(22, 8, '_wp_page_template', 'custom-form.php'),
(23, 11, '_menu_item_type', 'post_type'),
(24, 11, '_menu_item_menu_item_parent', '0'),
(25, 11, '_menu_item_object_id', '8'),
(26, 11, '_menu_item_object', 'page'),
(27, 11, '_menu_item_target', ''),
(28, 11, '_menu_item_classes', 'a:1:{i:0;s:0:"";}'),
(29, 11, '_menu_item_xfn', ''),
(30, 11, '_menu_item_url', ''),
(31, 10, '_wp_trash_meta_status', 'publish'),
(32, 10, '_wp_trash_meta_time', '1572777145'),
(8046, 384, '_um_custom_fields', 'a:6:{s:10:"user_login";a:15:{s:5:"title";s:8:"Username";s:7:"metakey";s:10:"user_login";s:4:"type";s:4:"text";s:5:"label";s:8:"Username";s:8:"required";i:1;s:6:"public";i:1;s:8:"editable";i:0;s:8:"validate";s:15:"unique_username";s:9:"min_chars";i:3;s:9:"max_chars";i:24;s:8:"position";s:1:"1";s:6:"in_row";s:9:"_um_row_1";s:10:"in_sub_row";s:1:"0";s:9:"in_column";s:1:"1";s:8:"in_group";s:0:"";}s:10:"user_email";a:13:{s:5:"title";s:14:"E-mail Address";s:7:"metakey";s:10:"user_email";s:4:"type";s:4:"text";s:5:"label";s:14:"E-mail Address";s:8:"required";i:0;s:6:"public";i:1;s:8:"editable";i:1;s:8:"validate";s:12:"unique_email";s:8:"position";s:1:"4";s:6:"in_row";s:9:"_um_row_1";s:10:"in_sub_row";s:1:"0";s:9:"in_column";s:1:"1";s:8:"in_group";s:0:"";}s:13:"user_password";a:16:{s:5:"title";s:8:"Password";s:7:"metakey";s:13:"user_password";s:4:"type";s:8:"password";s:5:"label";s:8:"Password";s:8:"required";i:1;s:6:"public";i:1;s:8:"editable";i:1;s:9:"min_chars";i:8;s:9:"max_chars";i:30;s:15:"force_good_pass";i:1;s:18:"force_confirm_pass";i:1;s:8:"position";s:1:"5";s:6:"in_row";s:9:"_um_row_1";s:10:"in_sub_row";s:1:"0";s:9:"in_column";s:1:"1";s:8:"in_group";s:0:"";}s:10:"first_name";a:12:{s:5:"title";s:10:"First Name";s:7:"metakey";s:10:"first_name";s:4:"type";s:4:"text";s:5:"label";s:10:"First Name";s:8:"required";i:0;s:6:"public";i:1;s:8:"editable";i:1;s:8:"position";s:1:"2";s:6:"in_row";s:9:"_um_row_1";s:10:"in_sub_row";s:1:"0";s:9:"in_column";s:1:"1";s:8:"in_group";s:0:"";}s:9:"last_name";a:12:{s:5:"title";s:9:"Last Name";s:7:"metakey";s:9:"last_name";s:4:"type";s:4:"text";s:5:"label";s:9:"Last Name";s:8:"required";i:0;s:6:"public";i:1;s:8:"editable";i:1;s:8:"position";s:1:"3";s:6:"in_row";s:9:"_um_row_1";s:10:"in_sub_row";s:1:"0";s:9:"in_column";s:1:"1";s:8:"in_group";s:0:"";}s:9:"_um_row_1";a:4:{s:4:"type";s:3:"row";s:2:"id";s:9:"_um_row_1";s:8:"sub_rows";s:1:"1";s:4:"cols";s:1:"1";}}'),
(8047, 384, '_um_mode', 'register'),
(8048, 384, '_um_core', 'register'),
(8049, 384, '_um_register_use_custom_settings', '0'),
(8050, 385, '_um_custom_fields', 'a:3:{s:8:"username";a:13:{s:5:"title";s:18:"Username or E-mail";s:7:"metakey";s:8:"username";s:4:"type";s:4:"text";s:5:"label";s:18:"Username or E-mail";s:8:"required";i:1;s:6:"public";i:1;s:8:"editable";i:0;s:8:"validate";s:24:"unique_username_or_email";s:8:"position";s:1:"1";s:6:"in_row";s:9:"_um_row_1";s:10:"in_sub_row";s:1:"0";s:9:"in_column";s:1:"1";s:8:"in_group";s:0:"";}s:13:"user_password";a:16:{s:5:"title";s:8:"Password";s:7:"metakey";s:13:"user_password";s:4:"type";s:8:"password";s:5:"label";s:8:"Password";s:8:"required";i:1;s:6:"public";i:1;s:8:"editable";i:1;s:9:"min_chars";i:8;s:9:"max_chars";i:30;s:15:"force_good_pass";i:1;s:18:"force_confirm_pass";i:1;s:8:"position";s:1:"2";s:6:"in_row";s:9:"_um_row_1";s:10:"in_sub_row";s:1:"0";s:9:"in_column";s:1:"1";s:8:"in_group";s:0:"";}s:9:"_um_row_1";a:4:{s:4:"type";s:3:"row";s:2:"id";s:9:"_um_row_1";s:8:"sub_rows";s:1:"1";s:4:"cols";s:1:"1";}}'),
(8051, 385, '_um_mode', 'login'),
(8052, 385, '_um_core', 'login'),
(8053, 385, '_um_login_use_custom_settings', '0'),
(8054, 386, '_um_custom_fields', 'a:1:{s:9:"_um_row_1";a:4:{s:4:"type";s:3:"row";s:2:"id";s:9:"_um_row_1";s:8:"sub_rows";s:1:"1";s:4:"cols";s:1:"1";}}'),
(8055, 386, '_um_mode', 'profile'),
(8056, 386, '_um_core', 'profile'),
(8057, 386, '_um_profile_use_custom_settings', '0'),
(8058, 387, '_um_core', 'members'),
(8059, 387, '_um_template', 'members'),
(8060, 387, '_um_mode', 'directory'),
(8061, 387, '_um_view_types', 'a:1:{i:0;s:4:"grid";}'),
(8062, 387, '_um_default_view', 'grid'),
(8063, 387, '_um_roles', 'a:0:{}'),
(8064, 387, '_um_has_profile_photo', '0'),
(8065, 387, '_um_has_cover_photo', '0'),
(8066, 387, '_um_show_these_users', ''),
(8067, 387, '_um_sortby', 'user_registered_desc'),
(8068, 387, '_um_sortby_custom', ''),
(8069, 387, '_um_enable_sorting', '0'),
(8070, 387, '_um_sorting_fields', 'a:0:{}'),
(8071, 387, '_um_profile_photo', '1'),
(8072, 387, '_um_cover_photos', '1'),
(8073, 387, '_um_show_name', '1'),
(8074, 387, '_um_show_tagline', '0'),
(8075, 387, '_um_tagline_fields', 'a:0:{}'),
(8076, 387, '_um_show_userinfo', '0'),
(8077, 387, '_um_reveal_fields', 'a:0:{}'),
(8078, 387, '_um_show_social', '0'),
(8079, 387, '_um_userinfo_animate', '1'),
(8080, 387, '_um_search', '0'),
(8081, 387, '_um_roles_can_search', 'a:0:{}'),
(8082, 387, '_um_filters', '0'),
(8083, 387, '_um_roles_can_filter', 'a:0:{}'),
(8084, 387, '_um_search_fields', 'a:0:{}'),
(8085, 387, '_um_filters_expanded', '0'),
(8086, 387, '_um_search_filters', 'a:0:{}'),
(8087, 387, '_um_must_search', '0'),
(8088, 387, '_um_max_users', ''),
(8089, 387, '_um_profiles_per_page', '12'),
(8090, 387, '_um_profiles_per_page_mobile', '6'),
(8091, 387, '_um_directory_header', '{total_users} Members'),
(8092, 387, '_um_directory_header_single', '{total_users} Member'),
(8093, 387, '_um_directory_no_users', 'We are sorry. We cannot find any users who match your search criteria.'),
(21003, 968, '_edit_lock', '1573818260:1'),
(21434, 984, '_edit_lock', '1573818476:1'),
(21529, 999, '_edit_lock', '1573825203:1'),
(21695, 1005, '_edit_lock', '1574022164:21'),
(21831, 1005, '_wp_page_template', 'form-confirmation.php'),
(32032, 1450, '_ip-address', '::1'),
(32033, 1450, '_request_user', 'Arthur'),
(32034, 1450, '_milliseconds', '261'),
(32035, 1450, 'request_headers|host', 'localhost'),
(32036, 1450, 'request_headers|user_agent', 'WordPress/5.2.4; http://localhost/wordpress'),
(32037, 1450, 'request_headers|accept', '*/*'),
(32038, 1450, 'request_headers|accept_encoding', 'deflate, gzip'),
(32039, 1450, 'request_headers|referer', 'http://localhost/wordpress/wp-json/wp/v2/types/post?context=edit'),
(32040, 1450, 'request_headers|cache_control', 'no-cache'),
(32041, 1450, 'request_headers|x_wp_nonce', '9be0b30e56'),
(32042, 1450, 'request_headers|cookie', 'wordpress_bbfa5b726c6b7a9cf3cda9370be3ee91=Arthur|1573967203|A4yrSfRMor2Qe7Vmd8yd4dXGOpl50zHoSx0VJRBHd6q|21564c4ca4e747e2cda5a7d1da76ad66b65b9e55381ef2085da8c7de698af392; wp-saving-post=1288-saved; wp-settings-1=libraryContent=browse&posts_list_mode=list; wp-settings-time-1=1573305776; wordpress_test_cookie=WP Cookie check; wordpress_logged_in_bbfa5b726c6b7a9cf3cda9370be3ee91=Arthur|1573967203|A4yrSfRMor2Qe7Vmd8yd4dXGOpl50zHoSx0VJRBHd6q|1ae742fd70049889af0952d7861d857bd7fd91aa49c7175c7653e792b520d215; adminer_permanent=c2VydmVy--cm9vdA==-bG9jYWw=:1T9T94ZLTzQ='),
(32043, 1450, 'request_headers|connection', 'close'),
(32044, 1450, 'request_query_params|context', 'edit'),
(32045, 1450, 'response_headers|X-Powered-By', 'PHP/7.3.8'),
(32046, 1450, 'response_headers|Content-Type', 'application/json; charset=UTF-8'),
(32047, 1450, 'response_headers|X-Robots-Tag', 'noindex'),
(32048, 1450, 'response_headers|Link', '<http//localhost/wordpress/wp-json/>; rel="https//api.w.org/"'),
(32049, 1450, 'response_headers|X-Content-Type-Options', 'nosniff'),
(32050, 1450, 'response_headers|Access-Control-Expose-Headers', 'X-WP-Total, X-WP-TotalPages'),
(32051, 1450, 'response_headers|Access-Control-Allow-Headers', 'Authorization, Content-Type'),
(32052, 1450, 'response_headers|Expires', 'Wed, 11 Jan 1984 050000 GMT'),
(32053, 1450, 'response_headers|Cache-Control', 'no-cache, must-revalidate, max-age=0'),
(32054, 1450, 'response_headers|X-WP-Nonce', '9be0b30e56'),
(32055, 1450, 'response_headers|X-QM-overview-time_taken', '0.4969'),
(32056, 1450, 'response_headers|X-QM-overview-time_usage', '1.7% of 30s limit') ;
INSERT INTO `wp_postmeta` ( `meta_id`, `post_id`, `meta_key`, `meta_value`) VALUES
(32057, 1450, 'response_headers|X-QM-overview-memory', '25,784 kB'),
(32058, 1450, 'response_headers|X-QM-overview-memory_usage', '19.7% of 131,072 kB limit'),
(32059, 1450, 'response_headers|Allow', 'GET'),
(32220, 383, '_wp_trash_meta_status', 'auto-draft'),
(32221, 383, '_wp_trash_meta_time', '1574020037'),
(32222, 383, '_wp_desired_post_slug', ''),
(32223, 968, '_wp_trash_meta_status', 'publish'),
(32224, 968, '_wp_trash_meta_time', '1574020103'),
(32225, 968, '_wp_desired_post_slug', 'asdasdasd'),
(32226, 1, '_wp_trash_meta_status', 'publish'),
(32227, 1, '_wp_trash_meta_time', '1574020103'),
(32228, 1, '_wp_desired_post_slug', '%d0%bf%d1%80%d0%b8%d0%b2%d1%96%d1%82-%d1%81%d0%b2%d1%96%d1%82'),
(32229, 1, '_wp_trash_meta_comments_status', 'a:1:{i:1;s:1:"1";}'),
(32230, 1484, '_edit_lock', '1574020157:1'),
(32231, 1485, '_edit_lock', '1574020099:1'),
(32232, 1486, '_edit_lock', '1574020601:1'),
(32233, 1487, '_edit_lock', '1574023092:1'),
(32242, 1492, '_wp_trash_meta_status', 'publish'),
(32243, 1492, '_wp_trash_meta_time', '1574021195'),
(32244, 1493, '_wp_trash_meta_status', 'publish'),
(32245, 1493, '_wp_trash_meta_time', '1574021427'),
(32246, 1494, '_edit_lock', '1574021544:1'),
(32247, 1494, '_wp_trash_meta_status', 'publish'),
(32248, 1494, '_wp_trash_meta_time', '1574021551'),
(32249, 1496, '_wp_trash_meta_status', 'publish'),
(32250, 1496, '_wp_trash_meta_time', '1574021840'),
(32252, 1497, '_customize_changeset_uuid', '175a6d18-7d51-4bb3-be12-763a948023b9'),
(32253, 1498, '_wp_trash_meta_status', 'publish'),
(32254, 1498, '_wp_trash_meta_time', '1574021919'),
(32255, 1499, '_edit_lock', '1574021920:21'),
(32280, 1499, '_wp_trash_meta_status', 'publish'),
(32281, 1499, '_wp_trash_meta_time', '1574021923'),
(32283, 1505, '_wp_trash_meta_status', 'publish'),
(32284, 1505, '_wp_trash_meta_time', '1574022011'),
(32285, 1504, '_customize_restore_dismissed', '1'),
(32286, 1506, '_wp_trash_meta_status', 'publish'),
(32287, 1506, '_wp_trash_meta_time', '1574022111'),
(32288, 1497, '_wp_trash_meta_status', 'publish'),
(32289, 1497, '_wp_trash_meta_time', '1574022149'),
(32290, 1497, '_wp_desired_post_slug', 'home'),
(32291, 1507, '_wp_trash_meta_status', 'publish'),
(32292, 1507, '_wp_trash_meta_time', '1574022155') ;

#
# End of data contents of table `wp_postmeta`
# --------------------------------------------------------



#
# Delete any existing table `wp_posts`
#

DROP TABLE IF EXISTS `wp_posts`;


#
# Table structure of table `wp_posts`
#

CREATE TABLE `wp_posts` (
  `ID` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `post_author` bigint(20) unsigned NOT NULL DEFAULT 0,
  `post_date` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `post_date_gmt` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `post_content` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `post_title` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `post_excerpt` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `post_status` varchar(20) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'publish',
  `comment_status` varchar(20) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'open',
  `ping_status` varchar(20) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'open',
  `post_password` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `post_name` varchar(200) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `to_ping` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `pinged` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `post_modified` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `post_modified_gmt` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `post_content_filtered` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `post_parent` bigint(20) unsigned NOT NULL DEFAULT 0,
  `guid` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `menu_order` int(11) NOT NULL DEFAULT 0,
  `post_type` varchar(20) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'post',
  `post_mime_type` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `comment_count` bigint(20) NOT NULL DEFAULT 0,
  PRIMARY KEY (`ID`),
  KEY `post_name` (`post_name`(191)),
  KEY `type_status_date` (`post_type`,`post_status`,`post_date`,`ID`),
  KEY `post_parent` (`post_parent`),
  KEY `post_author` (`post_author`)
) ENGINE=InnoDB AUTO_INCREMENT=1512 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;


#
# Data contents of table `wp_posts`
#
INSERT INTO `wp_posts` ( `ID`, `post_author`, `post_date`, `post_date_gmt`, `post_content`, `post_title`, `post_excerpt`, `post_status`, `comment_status`, `ping_status`, `post_password`, `post_name`, `to_ping`, `pinged`, `post_modified`, `post_modified_gmt`, `post_content_filtered`, `post_parent`, `guid`, `menu_order`, `post_type`, `post_mime_type`, `comment_count`) VALUES
(1, 1, '2019-11-03 12:21:16', '2019-11-03 10:21:16', '<!-- wp:paragraph -->\n<p>Ласкаво просимо до WordPress. Це ваш перший запис. Редагуйте або видаліть, а потім починайте писати!</p>\n<!-- /wp:paragraph -->', 'Привіт, світ!', '', 'trash', 'open', 'open', '', '%d0%bf%d1%80%d0%b8%d0%b2%d1%96%d1%82-%d1%81%d0%b2%d1%96%d1%82__trashed', '', '', '2019-11-17 21:48:23', '2019-11-17 19:48:23', '', 0, 'http://localhost/wordpress/?p=1', 0, 'post', '', 1),
(5, 1, '2019-11-03 12:25:51', '2019-11-03 10:25:51', '{"customtwentysixteen::nav_menu_locations[primary]":{"value":-2991692633338296300,"type":"theme_mod","user_id":1,"date_modified_gmt":"2019-11-03 10:25:51"},"nav_menu[-2991692633338296300]":{"value":{"name":"Menu","description":"","parent":0,"auto_add":false},"type":"nav_menu","user_id":1,"date_modified_gmt":"2019-11-03 10:25:51"},"nav_menu_item[-548312701895331840]":{"value":{"object_id":0,"object":"","menu_item_parent":0,"position":1,"type":"custom","title":"Home","url":"http:\\/\\/localhost\\/wordpress","target":"","attr_title":"","description":"","classes":"","xfn":"","status":"publish","original_title":"Home","nav_menu_term_id":-2991692633338296300,"_invalid":false,"type_label":"Custom Link"},"type":"nav_menu_item","user_id":1,"date_modified_gmt":"2019-11-03 10:25:51"},"nav_menu_item[-444569773909055500]":{"value":{"object_id":0,"object":"news","menu_item_parent":0,"position":2,"type":"post_type_archive","title":"All news","url":"http:\\/\\/localhost\\/wordpress\\/news\\/","target":"","attr_title":"","description":"","classes":"","xfn":"","status":"publish","original_title":"All news","nav_menu_term_id":-2991692633338296300,"_invalid":false,"type_label":"Post Type Archive"},"type":"nav_menu_item","user_id":1,"date_modified_gmt":"2019-11-03 10:25:51"}}', '', '', 'trash', 'closed', 'closed', '', '496d6469-cdfd-4c57-b68a-4cc31385b94e', '', '', '2019-11-03 12:25:51', '2019-11-03 10:25:51', '', 0, 'http://localhost/wordpress/2019/11/03/496d6469-cdfd-4c57-b68a-4cc31385b94e/', 0, 'customize_changeset', '', 0),
(7, 1, '2019-11-03 12:25:51', '2019-11-03 10:25:51', ' ', '', '', 'publish', 'closed', 'closed', '', '7', '', '', '2019-11-03 12:25:51', '2019-11-03 10:25:51', '', 0, 'http://localhost/wordpress/2019/11/03/7/', 2, 'nav_menu_item', '', 0),
(8, 1, '2019-11-03 12:31:58', '2019-11-03 10:31:58', '', 'Purpose news', '', 'publish', 'closed', 'closed', '', 'purpose-news', '', '', '2019-11-03 12:31:58', '2019-11-03 10:31:58', '', 0, 'http://localhost/wordpress/?page_id=8', 0, 'page', '', 0),
(9, 1, '2019-11-03 12:31:58', '2019-11-03 10:31:58', '', 'Purpose news', '', 'inherit', 'closed', 'closed', '', '8-revision-v1', '', '', '2019-11-03 12:31:58', '2019-11-03 10:31:58', '', 8, 'http://localhost/wordpress/2019/11/03/8-revision-v1/', 0, 'revision', '', 0),
(10, 1, '2019-11-03 12:32:25', '2019-11-03 10:32:25', '{"nav_menu_item[-6223589795378274000]":{"value":{"object_id":8,"object":"page","menu_item_parent":0,"position":3,"type":"post_type","title":"Purpose news","url":"http:\\/\\/localhost\\/wordpress\\/sample-page\\/purpose-news\\/","target":"","attr_title":"","description":"","classes":"","xfn":"","status":"publish","original_title":"Purpose news","nav_menu_term_id":2,"_invalid":false,"type_label":"Page"},"type":"nav_menu_item","user_id":1,"date_modified_gmt":"2019-11-03 10:32:25"}}', '', '', 'trash', 'closed', 'closed', '', '56a7bde9-d344-4869-a4f5-7001148e4997', '', '', '2019-11-03 12:32:25', '2019-11-03 10:32:25', '', 0, 'http://localhost/wordpress/2019/11/03/56a7bde9-d344-4869-a4f5-7001148e4997/', 0, 'customize_changeset', '', 0),
(11, 1, '2019-11-03 12:32:25', '2019-11-03 10:32:25', '', 'Propose news', '', 'publish', 'closed', 'closed', '', '11', '', '', '2019-11-17 22:12:30', '2019-11-17 20:12:30', '', 0, 'http://localhost/wordpress/2019/11/03/11/', 3, 'nav_menu_item', '', 0),
(382, 1, '2019-11-10 21:44:57', '0000-00-00 00:00:00', '', 'Auto Draft', '', 'auto-draft', 'open', 'open', '', '', '', '', '2019-11-10 21:44:57', '0000-00-00 00:00:00', '', 0, 'http://localhost/wordpress/?p=382', 0, 'post', '', 0),
(383, 4, '2019-11-17 21:47:17', '2019-11-17 19:47:17', '', 'Auto Draft', '', 'trash', 'open', 'open', '', '__trashed', '', '', '2019-11-17 21:47:17', '2019-11-17 19:47:17', '', 0, 'http://localhost/wordpress/?p=383', 0, 'post', '', 0),
(384, 1, '2019-11-11 20:59:21', '2019-11-11 18:59:21', '', 'Default Registration', '', 'publish', 'closed', 'closed', '', 'default-registration', '', '', '2019-11-11 20:59:21', '2019-11-11 18:59:21', '', 0, 'http://localhost/wordpress/um_form/default-registration/', 0, 'um_form', '', 0),
(385, 1, '2019-11-11 20:59:21', '2019-11-11 18:59:21', '', 'Default Login', '', 'publish', 'closed', 'closed', '', 'default-login', '', '', '2019-11-11 20:59:21', '2019-11-11 18:59:21', '', 0, 'http://localhost/wordpress/um_form/default-login/', 0, 'um_form', '', 0),
(386, 1, '2019-11-11 20:59:21', '2019-11-11 18:59:21', '', 'Default Profile', '', 'publish', 'closed', 'closed', '', 'default-profile', '', '', '2019-11-11 20:59:21', '2019-11-11 18:59:21', '', 0, 'http://localhost/wordpress/um_form/default-profile/', 0, 'um_form', '', 0),
(387, 1, '2019-11-11 20:59:21', '2019-11-11 18:59:21', '', 'Members', '', 'publish', 'closed', 'closed', '', 'members', '', '', '2019-11-11 20:59:21', '2019-11-11 18:59:21', '', 0, 'http://localhost/wordpress/um_directory/members/', 0, 'um_directory', '', 0),
(968, 1, '2019-11-15 13:46:24', '2019-11-15 11:46:24', '<!-- wp:paragraph {"backgroundColor":"light-blue"} -->\n<p class="has-background has-light-blue-background-color">asdasdasdasdasdasdasd</p>\n<!-- /wp:paragraph -->\n\n<!-- wp:image {"id":975} -->\n<figure class="wp-block-image"><img src="http://localhost/wordpress/wp-content/uploads/2019/11/0-02-04-8db1baa81c1f22f3fbf28ddce014a974db33886ed51467dafe9399beb19fa037_ade174ad.jpg" alt="" class="wp-image-975"/></figure>\n<!-- /wp:image -->', 'asdasdasd', '', 'trash', 'open', 'open', '', 'asdasdasd__trashed', '', '', '2019-11-17 21:48:23', '2019-11-17 19:48:23', '', 0, 'http://localhost/wordpress/?p=968', 0, 'post', '', 0),
(979, 1, '2019-11-15 13:46:24', '2019-11-15 11:46:24', '<!-- wp:paragraph {"backgroundColor":"light-blue"} -->\n<p class="has-background has-light-blue-background-color">asdasdasdasdasdasdasd</p>\n<!-- /wp:paragraph -->\n\n<!-- wp:image {"id":975} -->\n<figure class="wp-block-image"><img src="http://localhost/wordpress/wp-content/uploads/2019/11/0-02-04-8db1baa81c1f22f3fbf28ddce014a974db33886ed51467dafe9399beb19fa037_ade174ad.jpg" alt="" class="wp-image-975"/></figure>\n<!-- /wp:image -->', 'asdasdasd', '', 'inherit', 'closed', 'closed', '', '968-revision-v1', '', '', '2019-11-15 13:46:24', '2019-11-15 11:46:24', '', 968, 'http://localhost/wordpress/968-revision-v1/', 0, 'revision', '', 0),
(984, 1, '2019-11-15 13:46:53', '0000-00-00 00:00:00', '', 'Auto Draft', '', 'auto-draft', 'closed', 'closed', '', '', '', '', '2019-11-15 13:46:53', '2019-11-15 11:46:53', '', 0, 'http://localhost/wordpress/?post_type=news&#038;p=984', 0, 'news', '', 0),
(990, 1, '2019-11-15 14:06:31', '0000-00-00 00:00:00', '', 'Auto Draft', '', 'auto-draft', 'closed', 'closed', '', '', '', '', '2019-11-15 14:06:31', '2019-11-15 12:06:31', '', 0, 'http://localhost/wordpress/?post_type=news&#038;p=990', 0, 'news', '', 0),
(999, 1, '2019-11-15 15:36:30', '0000-00-00 00:00:00', '', 'Auto Draft', '', 'auto-draft', 'closed', 'closed', '', '', '', '', '2019-11-15 15:36:30', '0000-00-00 00:00:00', '', 0, 'http://localhost/wordpress/?page_id=999', 0, 'page', '', 0),
(1005, 1, '2019-11-15 15:42:19', '2019-11-15 13:42:19', '', 'Your message has been sent successfully', '', 'publish', 'closed', 'closed', '', 'your-message-has-been-sent-successfully', '', '', '2019-11-17 22:22:50', '2019-11-17 20:22:50', '', 0, 'http://localhost/wordpress/?page_id=1005', 0, 'page', '', 0),
(1010, 1, '2019-11-15 15:42:19', '2019-11-15 13:42:19', '', 'Your message has been sent successfully.', '', 'inherit', 'closed', 'closed', '', '1005-revision-v1', '', '', '2019-11-15 15:42:19', '2019-11-15 13:42:19', '', 1005, 'http://localhost/wordpress/1005-revision-v1/', 0, 'revision', '', 0),
(1360, 1, '2019-11-15 21:49:08', '0000-00-00 00:00:00', '', 'Auto Draft', '', 'auto-draft', 'closed', 'closed', '', '', '', '', '2019-11-15 21:49:08', '0000-00-00 00:00:00', '', 0, 'http://localhost/wordpress/?post_type=news&p=1360', 0, 'news', '', 0),
(1450, 0, '2019-11-16 09:41:10', '2019-11-16 07:41:10', '{"data":{"capabilities":{"edit_post":"edit_post","read_post":"read_post","delete_post":"delete_post","edit_posts":"edit_posts","edit_others_posts":"edit_others_posts","publish_posts":"publish_posts","read_private_posts":"read_private_posts","read":"read","delete_posts":"delete_posts","delete_private_posts":"delete_private_posts","delete_published_posts":"delete_published_posts","delete_others_posts":"delete_others_posts","edit_private_posts":"edit_private_posts","edit_published_posts":"edit_published_posts","create_posts":"edit_posts"},"description":"","hierarchical":false,"viewable":true,"labels":{"name":"Posts","singular_name":"Post","add_new":"Add New","add_new_item":"Add New Post","edit_item":"Edit Post","new_item":"New Post","view_item":"View Post","view_items":"View Posts","search_items":"Search Posts","not_found":"No posts found.","not_found_in_trash":"No posts found in Trash.","parent_item_colon":null,"all_items":"All Posts","archives":"Post Archives","attributes":"Post Attributes","insert_into_item":"Insert into post","uploaded_to_this_item":"Uploaded to this post","featured_image":"Featured Image","set_featured_image":"Set featured image","remove_featured_image":"Remove featured image","use_featured_image":"Use as featured image","filter_items_list":"Filter posts list","items_list_navigation":"Posts list navigation","items_list":"Posts list","item_published":"Post published.","item_published_privately":"Post published privately.","item_reverted_to_draft":"Post reverted to draft.","item_scheduled":"Post scheduled.","item_updated":"Post updated.","menu_name":"Posts","name_admin_bar":"Post"},"name":"Posts","slug":"post","supports":{"title":true,"editor":true,"author":true,"thumbnail":true,"excerpt":true,"trackbacks":true,"custom-fields":true,"comments":true,"revisions":true,"post-formats":true},"taxonomies":["category","post_tag"],"rest_base":"posts"},"headers":{"Allow":"GET"},"status":200}', '/wp/v2/types/post', '', 'publish', 'closed', 'closed', '', 'wp-v2-types-post-rzihbh', '', '', '2019-11-16 09:41:10', '2019-11-16 07:41:10', '', 0, 'http://localhost/wordpress/wp-admin/tools.php?page=wp-rest-api-log-view-entry&id=1450', 0, 'wp-rest-api-log', '', 0),
(1482, 1, '2019-11-17 21:47:17', '2019-11-17 19:47:17', '', 'Auto Draft', '', 'inherit', 'closed', 'closed', '', '383-revision-v1', '', '', '2019-11-17 21:47:17', '2019-11-17 19:47:17', '', 383, 'http://localhost/wordpress/383-revision-v1/', 0, 'revision', '', 0),
(1483, 1, '2019-11-17 21:48:23', '2019-11-17 19:48:23', '<!-- wp:paragraph -->\n<p>Ласкаво просимо до WordPress. Це ваш перший запис. Редагуйте або видаліть, а потім починайте писати!</p>\n<!-- /wp:paragraph -->', 'Привіт, світ!', '', 'inherit', 'closed', 'closed', '', '1-revision-v1', '', '', '2019-11-17 21:48:23', '2019-11-17 19:48:23', '', 1, 'http://localhost/wordpress/1-revision-v1/', 0, 'revision', '', 0),
(1484, 1, '2019-11-17 21:49:17', '0000-00-00 00:00:00', '', 'Auto Draft', '', 'auto-draft', 'open', 'open', '', '', '', '', '2019-11-17 21:49:17', '0000-00-00 00:00:00', '', 0, 'http://localhost/wordpress/?p=1484', 0, 'post', '', 0),
(1485, 1, '2019-11-17 21:49:18', '0000-00-00 00:00:00', '', 'Auto Draft', '', 'auto-draft', 'open', 'open', '', '', '', '', '2019-11-17 21:49:18', '0000-00-00 00:00:00', '', 0, 'http://localhost/wordpress/?p=1485', 0, 'post', '', 0),
(1486, 1, '2019-11-17 21:55:33', '0000-00-00 00:00:00', '', 'Auto Draft', '', 'auto-draft', 'open', 'open', '', '', '', '', '2019-11-17 21:55:33', '0000-00-00 00:00:00', '', 0, 'http://localhost/wordpress/?p=1486', 0, 'post', '', 0),
(1487, 1, '2019-11-17 22:03:13', '2019-11-17 20:03:13', '<!-- wp:paragraph -->\n<p>This is a test WP project that features <a href="http://localhost/WP-Blog/purpose-news/">news submit form</a>. Form supports submiting text and images. </p>\n<!-- /wp:paragraph -->\n\n<!-- wp:paragraph -->\n<p>Admin can then change the submited post status under "Proposed News" CPT to Published.</p>\n<!-- /wp:paragraph -->\n\n<!-- wp:paragraph -->\n<p>It will then appear on <a href="http://localhost/WP-Blog/news/">"All news" page</a>.</p>\n<!-- /wp:paragraph -->\n\n<!-- wp:paragraph -->\n<p>The same functionality is also available through REST API and is implimented in a <a href="https://github.com/ArthurGorbenko/NewsApp">simple react app</a>.</p>\n<!-- /wp:paragraph -->', 'Hello world', '', 'publish', 'open', 'open', '', 'hello-world', '', '', '2019-11-17 22:38:40', '2019-11-17 20:38:40', '', 0, 'http://localhost/wordpress/?p=1487', 0, 'post', '', 0),
(1488, 1, '2019-11-17 22:03:13', '2019-11-17 20:03:13', '<!-- wp:paragraph -->\n<p>This is a test WP project that features news submit form. Form supports submiting text and images. </p>\n<!-- /wp:paragraph -->\n\n<!-- wp:paragraph -->\n<p>Admin can then change the submited post status under "Proposed News" CPT to Published.</p>\n<!-- /wp:paragraph -->\n\n<!-- wp:paragraph -->\n<p>It will then appear at http://localhost/wordpress/news/.</p>\n<!-- /wp:paragraph -->\n\n<!-- wp:paragraph -->\n<p>The same functionality is also available through REST API and is implimented in a simple react app https://github.com/ArthurGorbenko/NewsApp.</p>\n<!-- /wp:paragraph -->', 'Hello world.', '', 'inherit', 'closed', 'closed', '', '1487-revision-v1', '', '', '2019-11-17 22:03:13', '2019-11-17 20:03:13', '', 1487, 'http://localhost/wordpress/1487-revision-v1/', 0, 'revision', '', 0),
(1489, 1, '2019-11-17 22:03:56', '2019-11-17 20:03:56', '<!-- wp:paragraph -->\n<p>This is a test WP project that features news submit form. Form supports submiting text and images. </p>\n<!-- /wp:paragraph -->\n\n<!-- wp:paragraph -->\n<p>Admin can then change the submited post status under "Proposed News" CPT to Published.</p>\n<!-- /wp:paragraph -->\n\n<!-- wp:paragraph -->\n<p>It will then appear at <a href="http://localhost/wordpress/news/.">http://localhost/wordpress/news/.</a></p>\n<!-- /wp:paragraph -->\n\n<!-- wp:paragraph -->\n<p>The same functionality is also available through REST API and is implimented in a simple react app <a href="https://github.com/ArthurGorbenko/NewsApp.">https://github.com/ArthurGorbenko/NewsApp.</a></p>\n<!-- /wp:paragraph -->', 'Hello world.', '', 'inherit', 'closed', 'closed', '', '1487-revision-v1', '', '', '2019-11-17 22:03:56', '2019-11-17 20:03:56', '', 1487, 'http://localhost/wordpress/1487-revision-v1/', 0, 'revision', '', 0),
(1490, 1, '2019-11-17 22:04:32', '2019-11-17 20:04:32', '<!-- wp:paragraph -->\n<p>This is a test WP project that features news submit form. Form supports submiting text and images. </p>\n<!-- /wp:paragraph -->\n\n<!-- wp:paragraph -->\n<p>Admin can then change the submited post status under "Proposed News" CPT to Published.</p>\n<!-- /wp:paragraph -->\n\n<!-- wp:paragraph -->\n<p>It will then appear at <a href="http://localhost/wordpress/news/.">http://localhost/wordpress/news/.</a></p>\n<!-- /wp:paragraph -->\n\n<!-- wp:paragraph -->\n<p>The same functionality is also available through REST API and is implimented in a simple react app <a href="https://github.com/ArthurGorbenko/NewsApp.">https://github.com/ArthurGorbenko/NewsApp</a></p>\n<!-- /wp:paragraph -->', 'Hello world.', '', 'inherit', 'closed', 'closed', '', '1487-revision-v1', '', '', '2019-11-17 22:04:32', '2019-11-17 20:04:32', '', 1487, 'http://localhost/wordpress/1487-revision-v1/', 0, 'revision', '', 0),
(1491, 1, '2019-11-17 22:05:29', '2019-11-17 20:05:29', '<!-- wp:paragraph -->\n<p>This is a test WP project that features news submit form. Form supports submiting text and images. </p>\n<!-- /wp:paragraph -->\n\n<!-- wp:paragraph -->\n<p>Admin can then change the submited post status under "Proposed News" CPT to Published.</p>\n<!-- /wp:paragraph -->\n\n<!-- wp:paragraph -->\n<p>It will then appear at <a href="http://localhost/wordpress/news/.">http://localhost/wordpress/news/.</a></p>\n<!-- /wp:paragraph -->\n\n<!-- wp:paragraph -->\n<p>The same functionality is also available through REST API and is implimented in a simple react app <a href="https://github.com/ArthurGorbenko/NewsApp">https://github.com/ArthurGorbenko/NewsApp</a></p>\n<!-- /wp:paragraph -->', 'Hello world.', '', 'inherit', 'closed', 'closed', '', '1487-revision-v1', '', '', '2019-11-17 22:05:29', '2019-11-17 20:05:29', '', 1487, 'http://localhost/wordpress/1487-revision-v1/', 0, 'revision', '', 0),
(1492, 1, '2019-11-17 22:06:35', '2019-11-17 20:06:35', '{"sidebars_widgets[sidebar-1]":{"value":["search-2","recent-posts-2","recent-comments-2","archives-2","meta-2"],"type":"option","user_id":1,"date_modified_gmt":"2019-11-17 20:06:35"},"twentysixteen-child::header_textcolor":{"value":"blank","type":"theme_mod","user_id":1,"date_modified_gmt":"2019-11-17 20:06:35"}}', '', '', 'trash', 'closed', 'closed', '', '72c7fd77-5158-40e7-b5d0-cdd72ad0a965', '', '', '2019-11-17 22:06:35', '2019-11-17 20:06:35', '', 0, 'http://localhost/wordpress/72c7fd77-5158-40e7-b5d0-cdd72ad0a965/', 0, 'customize_changeset', '', 0),
(1493, 1, '2019-11-17 22:10:27', '2019-11-17 20:10:27', '{"blogdescription":{"value":"","type":"option","user_id":1,"date_modified_gmt":"2019-11-17 20:10:27"},"twentysixteen-child::header_textcolor":{"value":"","type":"theme_mod","user_id":1,"date_modified_gmt":"2019-11-17 20:10:27"}}', '', '', 'trash', 'closed', 'closed', '', 'ebe18bfa-69c4-407d-8539-b7ab798bc5b1', '', '', '2019-11-17 22:10:27', '2019-11-17 20:10:27', '', 0, 'http://localhost/wordpress/ebe18bfa-69c4-407d-8539-b7ab798bc5b1/', 0, 'customize_changeset', '', 0),
(1494, 1, '2019-11-17 22:12:30', '2019-11-17 20:12:30', '{"nav_menu_item[11]":{"value":{"menu_item_parent":0,"object_id":8,"object":"page","type":"post_type","type_label":"Page","url":"http:\\/\\/localhost\\/wordpress\\/purpose-news\\/","title":"Propose news","target":"","attr_title":"","description":"","classes":"","xfn":"","nav_menu_term_id":2,"position":3,"status":"publish","original_title":"Purpose news","_invalid":false},"type":"nav_menu_item","user_id":1,"date_modified_gmt":"2019-11-17 20:12:24"}}', '', '', 'trash', 'closed', 'closed', '', '386d04d2-19e2-4d52-8677-a4c085d8aa19', '', '', '2019-11-17 22:12:30', '2019-11-17 20:12:30', '', 0, 'http://localhost/wordpress/?p=1494', 0, 'customize_changeset', '', 0),
(1495, 21, '2019-11-17 22:16:30', '0000-00-00 00:00:00', '', 'Auto Draft', '', 'auto-draft', 'open', 'open', '', '', '', '', '2019-11-17 22:16:30', '0000-00-00 00:00:00', '', 0, 'http://localhost/WP-Blog/?p=1495', 0, 'post', '', 0),
(1496, 1, '2019-11-17 22:17:20', '2019-11-17 20:17:20', '{"nav_menu_item[6]":{"value":{"menu_item_parent":0,"object_id":6,"object":"custom","type":"custom","type_label":"Custom Link","title":"Home","url":"http:\\/\\/localhost\\/WP-Blog","target":"","attr_title":"","description":"","classes":"","xfn":"","nav_menu_term_id":2,"position":1,"status":"publish","original_title":"","_invalid":false},"type":"nav_menu_item","user_id":1,"date_modified_gmt":"2019-11-17 20:17:20"}}', '', '', 'trash', 'closed', 'closed', '', 'c5557ee2-8702-4c8b-a8b6-7828a0b90bfd', '', '', '2019-11-17 22:17:20', '2019-11-17 20:17:20', '', 0, 'http://localhost/WP-Blog/c5557ee2-8702-4c8b-a8b6-7828a0b90bfd/', 0, 'customize_changeset', '', 0),
(1497, 21, '2019-11-17 22:18:43', '2019-11-17 20:18:43', '', 'Home', '', 'trash', 'closed', 'closed', '', 'home__trashed', '', '', '2019-11-17 22:22:29', '2019-11-17 20:22:29', '', 0, 'http://localhost/WP-Blog/?page_id=1497', 0, 'page', '', 0),
(1498, 1, '2019-11-17 22:18:39', '2019-11-17 20:18:39', '{"nav_menu_item[6]":{"value":{"menu_item_parent":0,"object_id":6,"object":"custom","type":"custom","type_label":"Custom Link","title":"Home","url":"http:\\/\\/localhost\\/wordpress","target":"","attr_title":"","description":"","classes":"","xfn":"","nav_menu_term_id":2,"position":1,"status":"publish","original_title":"","_invalid":false},"type":"nav_menu_item","user_id":1,"date_modified_gmt":"2019-11-17 20:18:39"}}', '', '', 'trash', 'closed', 'closed', '', '49a4e0ab-3560-412d-b3f6-445f8d4f4af3', '', '', '2019-11-17 22:18:39', '2019-11-17 20:18:39', '', 0, 'http://localhost/WP-Blog/49a4e0ab-3560-412d-b3f6-445f8d4f4af3/', 0, 'customize_changeset', '', 0),
(1499, 21, '2019-11-17 22:18:43', '2019-11-17 20:18:43', '{"nav_menus_created_posts":{"value":[1497],"type":"option","user_id":21,"date_modified_gmt":"2019-11-17 20:18:40"},"nav_menu_item[-6234370806507975000]":{"value":{"object_id":1497,"object":"page","menu_item_parent":0,"position":4,"type":"post_type","title":"Home","url":"http:\\/\\/localhost\\/WP-Blog\\/?page_id=1497","target":"","attr_title":"","description":"","classes":"","xfn":"","status":"publish","original_title":"Home","nav_menu_term_id":2,"_invalid":false,"type_label":"Page"},"type":"nav_menu_item","user_id":21,"date_modified_gmt":"2019-11-17 20:18:40"},"nav_menu_item[-8056890996654041000]":{"value":{"object_id":1497,"object":"page","menu_item_parent":0,"position":5,"type":"post_type","title":"Home","url":"http:\\/\\/localhost\\/WP-Blog\\/?page_id=1497","target":"","attr_title":"","description":"","classes":"","xfn":"","status":"publish","original_title":"Home","nav_menu_term_id":2,"_invalid":false,"type_label":"Page"},"type":"nav_menu_item","user_id":21,"date_modified_gmt":"2019-11-17 20:18:40"},"nav_menu_item[-3184575085663230000]":{"value":{"object_id":1497,"object":"page","menu_item_parent":0,"position":6,"type":"post_type","title":"Home","url":"http:\\/\\/localhost\\/WP-Blog\\/?page_id=1497","target":"","attr_title":"","description":"","classes":"","xfn":"","status":"publish","original_title":"Home","nav_menu_term_id":2,"_invalid":false,"type_label":"Page"},"type":"nav_menu_item","user_id":21,"date_modified_gmt":"2019-11-17 20:18:40"}}', '', '', 'trash', 'closed', 'closed', '', '175a6d18-7d51-4bb3-be12-763a948023b9', '', '', '2019-11-17 22:18:43', '2019-11-17 20:18:43', '', 0, 'http://localhost/WP-Blog/?p=1499', 0, 'customize_changeset', '', 0),
(1500, 21, '2019-11-17 22:18:43', '2019-11-17 20:18:43', '', 'Home', '', 'inherit', 'closed', 'closed', '', '1497-revision-v1', '', '', '2019-11-17 22:18:43', '2019-11-17 20:18:43', '', 1497, 'http://localhost/WP-Blog/1497-revision-v1/', 0, 'revision', '', 0),
(1504, 21, '2019-11-17 22:19:35', '0000-00-00 00:00:00', '{"nav_menu_item[1501]":{"value":false,"type":"nav_menu_item","user_id":21,"date_modified_gmt":"2019-11-17 20:19:35"},"nav_menu_item[1502]":{"value":false,"type":"nav_menu_item","user_id":21,"date_modified_gmt":"2019-11-17 20:19:35"},"nav_menu_item[1503]":{"value":false,"type":"nav_menu_item","user_id":21,"date_modified_gmt":"2019-11-17 20:19:35"}}', '', '', 'auto-draft', 'closed', 'closed', '', '792e5243-2e19-4525-bd91-97c83a2ef9bd', '', '', '2019-11-17 22:19:35', '0000-00-00 00:00:00', '', 0, 'http://localhost/WP-Blog/?p=1504', 0, 'customize_changeset', '', 0),
(1505, 1, '2019-11-17 22:20:11', '2019-11-17 20:20:11', '{"nav_menu_item[1501]":{"value":false,"type":"nav_menu_item","user_id":1,"date_modified_gmt":"2019-11-17 20:20:11"},"nav_menu_item[1502]":{"value":false,"type":"nav_menu_item","user_id":1,"date_modified_gmt":"2019-11-17 20:20:11"},"nav_menu_item[1503]":{"value":false,"type":"nav_menu_item","user_id":1,"date_modified_gmt":"2019-11-17 20:20:11"}}', '', '', 'trash', 'closed', 'closed', '', '9721a551-65af-4674-aa63-4c66bbe2f948', '', '', '2019-11-17 22:20:11', '2019-11-17 20:20:11', '', 0, 'http://localhost/WP-Blog/9721a551-65af-4674-aa63-4c66bbe2f948/', 0, 'customize_changeset', '', 0),
(1506, 21, '2019-11-17 22:21:51', '2019-11-17 20:21:51', '{"nav_menu_item[6]":{"value":false,"type":"nav_menu_item","user_id":21,"date_modified_gmt":"2019-11-17 20:21:51"}}', '', '', 'trash', 'closed', 'closed', '', '69ece25f-f357-4d92-956b-caae39f11e85', '', '', '2019-11-17 22:21:51', '2019-11-17 20:21:51', '', 0, 'http://localhost/WP-Blog/69ece25f-f357-4d92-956b-caae39f11e85/', 0, 'customize_changeset', '', 0),
(1507, 1, '2019-11-17 22:22:35', '2019-11-17 20:22:35', '{"blogname":{"value":"Test WP project","type":"option","user_id":1,"date_modified_gmt":"2019-11-17 20:22:35"}}', '', '', 'trash', 'closed', 'closed', '', '8394cbbe-78d4-4f65-9c3e-ef720052c7e1', '', '', '2019-11-17 22:22:35', '2019-11-17 20:22:35', '', 0, 'http://localhost/WP-Blog/8394cbbe-78d4-4f65-9c3e-ef720052c7e1/', 0, 'customize_changeset', '', 0),
(1508, 21, '2019-11-17 22:22:50', '2019-11-17 20:22:50', '', 'Your message has been sent successfully', '', 'inherit', 'closed', 'closed', '', '1005-revision-v1', '', '', '2019-11-17 22:22:50', '2019-11-17 20:22:50', '', 1005, 'http://localhost/WP-Blog/1005-revision-v1/', 0, 'revision', '', 0),
(1509, 21, '2019-11-17 22:23:08', '2019-11-17 20:23:08', '<!-- wp:paragraph -->\n<p>This is a test WP project that features news submit form. Form supports submiting text and images. </p>\n<!-- /wp:paragraph -->\n\n<!-- wp:paragraph -->\n<p>Admin can then change the submited post status under "Proposed News" CPT to Published.</p>\n<!-- /wp:paragraph -->\n\n<!-- wp:paragraph -->\n<p>It will then appear at <a href="http://localhost/wordpress/news/.">http://localhost/wordpress/news/.</a></p>\n<!-- /wp:paragraph -->\n\n<!-- wp:paragraph -->\n<p>The same functionality is also available through REST API and is implimented in a simple react app <a href="https://github.com/ArthurGorbenko/NewsApp">https://github.com/ArthurGorbenko/NewsApp</a></p>\n<!-- /wp:paragraph -->', 'Hello world', '', 'inherit', 'closed', 'closed', '', '1487-revision-v1', '', '', '2019-11-17 22:23:08', '2019-11-17 20:23:08', '', 1487, 'http://localhost/WP-Blog/1487-revision-v1/', 0, 'revision', '', 0),
(1510, 21, '2019-11-17 22:26:31', '2019-11-17 20:26:31', '<!-- wp:paragraph -->\n<p>This is a test WP project that features <a href="http://localhost/wordpress/purpose-news/">news submit form</a>. Form supports submiting text and images. </p>\n<!-- /wp:paragraph -->\n\n<!-- wp:paragraph -->\n<p>Admin can then change the submited post status under "Proposed News" CPT to Published.</p>\n<!-- /wp:paragraph -->\n\n<!-- wp:paragraph -->\n<p>It will then appear on <a href="http://localhost/wordpress/news/">"All news" page</a>.</p>\n<!-- /wp:paragraph -->\n\n<!-- wp:paragraph -->\n<p>The same functionality is also available through REST API and is implimented in a <a href="https://github.com/ArthurGorbenko/NewsApp">simple react app</a>.</p>\n<!-- /wp:paragraph -->', 'Hello world', '', 'inherit', 'closed', 'closed', '', '1487-revision-v1', '', '', '2019-11-17 22:26:31', '2019-11-17 20:26:31', '', 1487, 'http://localhost/WP-Blog/1487-revision-v1/', 0, 'revision', '', 0),
(1511, 1, '2019-11-17 22:38:40', '2019-11-17 20:38:40', '<!-- wp:paragraph -->\n<p>This is a test WP project that features <a href="http://localhost/WP-Blog/purpose-news/">news submit form</a>. Form supports submiting text and images. </p>\n<!-- /wp:paragraph -->\n\n<!-- wp:paragraph -->\n<p>Admin can then change the submited post status under "Proposed News" CPT to Published.</p>\n<!-- /wp:paragraph -->\n\n<!-- wp:paragraph -->\n<p>It will then appear on <a href="http://localhost/WP-Blog/news/">"All news" page</a>.</p>\n<!-- /wp:paragraph -->\n\n<!-- wp:paragraph -->\n<p>The same functionality is also available through REST API and is implimented in a <a href="https://github.com/ArthurGorbenko/NewsApp">simple react app</a>.</p>\n<!-- /wp:paragraph -->', 'Hello world', '', 'inherit', 'closed', 'closed', '', '1487-revision-v1', '', '', '2019-11-17 22:38:40', '2019-11-17 20:38:40', '', 1487, 'http://localhost/WP-Blog/1487-revision-v1/', 0, 'revision', '', 0) ;

#
# End of data contents of table `wp_posts`
# --------------------------------------------------------



#
# Delete any existing table `wp_term_relationships`
#

DROP TABLE IF EXISTS `wp_term_relationships`;


#
# Table structure of table `wp_term_relationships`
#

CREATE TABLE `wp_term_relationships` (
  `object_id` bigint(20) unsigned NOT NULL DEFAULT 0,
  `term_taxonomy_id` bigint(20) unsigned NOT NULL DEFAULT 0,
  `term_order` int(11) NOT NULL DEFAULT 0,
  PRIMARY KEY (`object_id`,`term_taxonomy_id`),
  KEY `term_taxonomy_id` (`term_taxonomy_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;


#
# Data contents of table `wp_term_relationships`
#
INSERT INTO `wp_term_relationships` ( `object_id`, `term_taxonomy_id`, `term_order`) VALUES
(1, 1, 0),
(7, 2, 0),
(11, 2, 0),
(383, 1, 0),
(968, 1, 0),
(1450, 5, 0),
(1450, 6, 0),
(1450, 7, 0),
(1487, 1, 0) ;

#
# End of data contents of table `wp_term_relationships`
# --------------------------------------------------------



#
# Delete any existing table `wp_term_taxonomy`
#

DROP TABLE IF EXISTS `wp_term_taxonomy`;


#
# Table structure of table `wp_term_taxonomy`
#

CREATE TABLE `wp_term_taxonomy` (
  `term_taxonomy_id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `term_id` bigint(20) unsigned NOT NULL DEFAULT 0,
  `taxonomy` varchar(32) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `description` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `parent` bigint(20) unsigned NOT NULL DEFAULT 0,
  `count` bigint(20) NOT NULL DEFAULT 0,
  PRIMARY KEY (`term_taxonomy_id`),
  UNIQUE KEY `term_id_taxonomy` (`term_id`,`taxonomy`),
  KEY `taxonomy` (`taxonomy`)
) ENGINE=InnoDB AUTO_INCREMENT=14 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;


#
# Data contents of table `wp_term_taxonomy`
#
INSERT INTO `wp_term_taxonomy` ( `term_taxonomy_id`, `term_id`, `taxonomy`, `description`, `parent`, `count`) VALUES
(1, 1, 'category', '', 0, 1),
(2, 2, 'nav_menu', '', 0, 2),
(3, 3, 'wp-rest-api-log-method', '', 0, 0),
(4, 4, 'wp-rest-api-log-status', '', 0, 0),
(5, 5, 'wp-rest-api-log-source', '', 0, 1),
(6, 6, 'wp-rest-api-log-status', '', 0, 1),
(7, 7, 'wp-rest-api-log-method', '', 0, 1),
(8, 8, 'wp-rest-api-log-status', '', 0, 0),
(9, 9, 'wp-rest-api-log-method', '', 0, 0),
(10, 10, 'wp-rest-api-log-method', '', 0, 0),
(11, 11, 'wp-rest-api-log-status', '', 0, 0),
(12, 12, 'wp-rest-api-log-status', '', 0, 0),
(13, 13, 'wp-rest-api-log-status', '', 0, 0) ;

#
# End of data contents of table `wp_term_taxonomy`
# --------------------------------------------------------



#
# Delete any existing table `wp_termmeta`
#

DROP TABLE IF EXISTS `wp_termmeta`;


#
# Table structure of table `wp_termmeta`
#

CREATE TABLE `wp_termmeta` (
  `meta_id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `term_id` bigint(20) unsigned NOT NULL DEFAULT 0,
  `meta_key` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `meta_value` longtext COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`meta_id`),
  KEY `term_id` (`term_id`),
  KEY `meta_key` (`meta_key`(191))
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;


#
# Data contents of table `wp_termmeta`
#

#
# End of data contents of table `wp_termmeta`
# --------------------------------------------------------



#
# Delete any existing table `wp_terms`
#

DROP TABLE IF EXISTS `wp_terms`;


#
# Table structure of table `wp_terms`
#

CREATE TABLE `wp_terms` (
  `term_id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(200) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `slug` varchar(200) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `term_group` bigint(10) NOT NULL DEFAULT 0,
  PRIMARY KEY (`term_id`),
  KEY `slug` (`slug`(191)),
  KEY `name` (`name`(191))
) ENGINE=InnoDB AUTO_INCREMENT=14 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;


#
# Data contents of table `wp_terms`
#
INSERT INTO `wp_terms` ( `term_id`, `name`, `slug`, `term_group`) VALUES
(1, 'Без категорії', '%d0%b1%d0%b5%d0%b7-%d0%ba%d0%b0%d1%82%d0%b5%d0%b3%d0%be%d1%80%d1%96%d1%97', 0),
(2, 'Menu', 'menu', 0),
(3, 'POST', 'post', 0),
(4, '500', '500', 0),
(5, 'WP REST API', 'wp-rest-api', 0),
(6, '200', '200', 0),
(7, 'GET', 'get', 0),
(8, '404', '404', 0),
(9, 'PUT', 'put', 0),
(10, 'DELETE', 'delete', 0),
(11, '401', '401', 0),
(12, '403', '403', 0),
(13, '201', '201', 0) ;

#
# End of data contents of table `wp_terms`
# --------------------------------------------------------



#
# Delete any existing table `wp_usermeta`
#

DROP TABLE IF EXISTS `wp_usermeta`;


#
# Table structure of table `wp_usermeta`
#

CREATE TABLE `wp_usermeta` (
  `umeta_id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `user_id` bigint(20) unsigned NOT NULL DEFAULT 0,
  `meta_key` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `meta_value` longtext COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`umeta_id`),
  KEY `user_id` (`user_id`),
  KEY `meta_key` (`meta_key`(191))
) ENGINE=InnoDB AUTO_INCREMENT=308 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;


#
# Data contents of table `wp_usermeta`
#
INSERT INTO `wp_usermeta` ( `umeta_id`, `user_id`, `meta_key`, `meta_value`) VALUES
(1, 1, 'nickname', 'Arthur'),
(2, 1, 'first_name', ''),
(3, 1, 'last_name', ''),
(4, 1, 'description', ''),
(5, 1, 'rich_editing', 'true'),
(6, 1, 'syntax_highlighting', 'true'),
(7, 1, 'comment_shortcuts', 'false'),
(8, 1, 'admin_color', 'fresh'),
(9, 1, 'use_ssl', '0'),
(10, 1, 'show_admin_bar_front', 'true'),
(11, 1, 'locale', ''),
(12, 1, 'wp_capabilities', 'a:1:{s:13:"administrator";b:1;}'),
(13, 1, 'wp_user_level', '10'),
(14, 1, 'dismissed_wp_pointers', ''),
(15, 1, 'show_welcome_panel', '1'),
(16, 1, 'session_tokens', 'a:6:{s:64:"fef29c43ce4ee1fd1e951ea8a032ac93e77557e640a53e8f27f25f35b3f97a53";a:4:{s:10:"expiration";i:1574061819;s:2:"ip";s:3:"::1";s:2:"ua";s:114:"Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/78.0.3904.97 Safari/537.36";s:5:"login";i:1573889019;}s:64:"8926f8fb9deb1a271c03353bc4639926655188e09c0e5b2e80c1d48bdccfb07b";a:4:{s:10:"expiration";i:1574112153;s:2:"ip";s:3:"::1";s:2:"ua";s:114:"Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/78.0.3904.97 Safari/537.36";s:5:"login";i:1573939353;}s:64:"3bb041ca134f643f137c13511650417103736a764b1a5f5371bd52453a881ae6";a:4:{s:10:"expiration";i:1574116014;s:2:"ip";s:3:"::1";s:2:"ua";s:114:"Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/78.0.3904.97 Safari/537.36";s:5:"login";i:1573943214;}s:64:"2f3fb0e3d48e8dd61fa7fe991b8d03bfb638201c5b1543f57b65adf37cac374a";a:4:{s:10:"expiration";i:1574182535;s:2:"ip";s:3:"::1";s:2:"ua";s:114:"Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/78.0.3904.97 Safari/537.36";s:5:"login";i:1574009735;}s:64:"6672b2fe3e03f85096193d5b69ea2ef31f6e09907012a43b89287d0af5ab5b86";a:4:{s:10:"expiration";i:1574194518;s:2:"ip";s:14:"213.111.67.158";s:2:"ua";s:114:"Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/78.0.3904.97 Safari/537.36";s:5:"login";i:1574021718;}s:64:"94d3f587f4b9a3b7451c0c7e1ea5aa0777b736142769bc8401597135aba2a3c1";a:4:{s:10:"expiration";i:1574195754;s:2:"ip";s:3:"::1";s:2:"ua";s:104:"Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/78.0.3904.97 Safari/537.36";s:5:"login";i:1574022954;}}'),
(17, 1, 'wp_dashboard_quick_press_last_post_id', '382'),
(18, 1, 'wp_user-settings', 'libraryContent=browse&posts_list_mode=list'),
(19, 1, 'wp_user-settings-time', '1573305795'),
(20, 1, 'edit_wp-rest-api-log_per_page', '100'),
(21, 1, 'meta-box-order_news', 'a:3:{s:4:"side";s:22:"submitdiv,postimagediv";s:6:"normal";s:30:"postexcerpt,postcustom,slugdiv";s:8:"advanced";s:0:"";}'),
(22, 1, 'screen_layout_news', '2'),
(23, 1, 'closedpostboxes_news', 'a:0:{}'),
(24, 1, 'metaboxhidden_news', 'a:1:{i:0;s:7:"slugdiv";}'),
(113, 1, 'account_status', 'approved'),
(290, 21, 'nickname', 'admin'),
(291, 21, 'first_name', ''),
(292, 21, 'last_name', ''),
(293, 21, 'description', ''),
(294, 21, 'rich_editing', 'true'),
(295, 21, 'syntax_highlighting', 'true'),
(296, 21, 'comment_shortcuts', 'false'),
(297, 21, 'admin_color', 'fresh'),
(298, 21, 'use_ssl', '0'),
(299, 21, 'show_admin_bar_front', 'true'),
(300, 21, 'locale', ''),
(301, 21, 'wp_capabilities', 'a:1:{s:13:"administrator";b:1;}'),
(302, 21, 'wp_user_level', '10'),
(303, 21, 'dismissed_wp_pointers', ''),
(304, 1, 'community-events-location', 'a:1:{s:2:"ip";s:12:"213.111.67.0";}'),
(305, 21, 'session_tokens', 'a:1:{s:64:"7c46e4486cb50d1ae1bf42e6ba40cf3052a4919c1415922d9cd606ba03fd73d1";a:4:{s:10:"expiration";i:1574194589;s:2:"ip";s:13:"176.36.223.13";s:2:"ua";s:104:"Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/78.0.3904.97 Safari/537.36";s:5:"login";i:1574021789;}}'),
(306, 21, 'wp_dashboard_quick_press_last_post_id', '1495'),
(307, 21, 'community-events-location', 'a:1:{s:2:"ip";s:12:"176.36.223.0";}') ;

#
# End of data contents of table `wp_usermeta`
# --------------------------------------------------------



#
# Delete any existing table `wp_users`
#

DROP TABLE IF EXISTS `wp_users`;


#
# Table structure of table `wp_users`
#

CREATE TABLE `wp_users` (
  `ID` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `user_login` varchar(60) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `user_pass` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `user_nicename` varchar(50) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `user_email` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `user_url` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `user_registered` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `user_activation_key` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `user_status` int(11) NOT NULL DEFAULT 0,
  `display_name` varchar(250) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  PRIMARY KEY (`ID`),
  KEY `user_login_key` (`user_login`),
  KEY `user_nicename` (`user_nicename`),
  KEY `user_email` (`user_email`)
) ENGINE=InnoDB AUTO_INCREMENT=22 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;


#
# Data contents of table `wp_users`
#
INSERT INTO `wp_users` ( `ID`, `user_login`, `user_pass`, `user_nicename`, `user_email`, `user_url`, `user_registered`, `user_activation_key`, `user_status`, `display_name`) VALUES
(1, 'Arthur', '$P$Bb4k3fm9cEl.EBtAw2k3/DN9uciUxQ.', 'arthur', 'gorbenkoartur.ur@gmail.com', '', '2019-11-03 10:21:16', '', 0, 'Arthur'),
(21, 'admin', '$P$B5UbGqBBkmuPokY3J4ARPV4PMeER2B.', 'admin', 'admin@localhost.com', '', '2019-11-17 19:53:53', '', 0, 'admin') ;

#
# End of data contents of table `wp_users`
# --------------------------------------------------------

#
# Add constraints back in and apply any alter data queries.
#

