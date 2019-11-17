<?php
define('JWT_AUTH_SECRET_KEY', 'DjKb1996');
/**
 * The base configuration for WordPress
 *
 * The wp-config.php creation script uses this file during the
 * installation. You don't have to use the web site, you can
 * copy this file to "wp-config.php" and fill in the values.
 *
 * This file contains the following configurations:
 *
 * * MySQL settings
 * * Secret keys
 * * Database table prefix
 * * ABSPATH
 *
 * @link https://codex.wordpress.org/Editing_wp-config.php
 *
 * @package WordPress
 */

// ** MySQL settings - You can get this info from your web host ** //
/** The name of the database for WordPress */
define( 'DB_NAME', 'wordpress' );

/** MySQL database username */
define( 'DB_USER', 'root' );

/** MySQL database password */
define( 'DB_PASSWORD', '' );

/** MySQL hostname */
define( 'DB_HOST', 'localhost' );

/** Database Charset to use in creating database tables. */
define( 'DB_CHARSET', 'utf8mb4' );

/** The Database Collate type. Don't change this if in doubt. */
define( 'DB_COLLATE', '' );

/**#@+
 * Authentication Unique Keys and Salts.
 *
 * Change these to different unique phrases!
 * You can generate these using the {@link https://api.wordpress.org/secret-key/1.1/salt/ WordPress.org secret-key service}
 * You can change these at any point in time to invalidate all existing cookies. This will force all users to have to log in again.
 *
 * @since 2.6.0
 */
define( 'AUTH_KEY',         'DX)~@*? IgnNSNYe}[3IWas&~<7*:NxVtF&Wr^5<c6Z24T?dzP=?I`l>:%!Ro+br' );
define( 'SECURE_AUTH_KEY',  'L5_5_F>J=jzy_ECl)u,g+q2FuQ&8k4k`t+-Sf>]R+;6;pRCG/NkE5[Hn%%1LCVCu' );
define( 'LOGGED_IN_KEY',    'Q+Vn>P[QMJEI00>ek0=t#d_yJ,)DaO[Jxf^&GO:2d|@L,Ze4S-lN)>]I.hf*o949' );
define( 'NONCE_KEY',        'XbAJBSm#*&1mx9%+:G_@h~XZ5q`20M|U!8v2JEBV9tDm9|t;LJ{X1)ZQRO|b|qbP' );
define( 'AUTH_SALT',        '@D4n5K&(Bd&>Z*V3c&ZES,)3njU{?1T5Sh.gKEJhs@3+T(/3zsp6|4Z]HofyO<3F' );
define( 'SECURE_AUTH_SALT', 'L@(bCva|(/lTS=bh~eVhOQV=%!yAqvL|]dP8_RK~uC~&#,>&6&F1<.j+#J`F``WV' );
define( 'LOGGED_IN_SALT',   '=O(7BI1`/*I&h,3B`PN1?M-4g:2wRdDjtENX67G&cxvjt VUlR*NvU)+rcNs_:#?' );
define( 'NONCE_SALT',       '! [D]ms}h?OwDeEI/..X_/6>l*vO%o3f+:U(1ax`s47UC9QHK^>_)p|M;!6A|<z,' );

/**#@-*/

/**
 * WordPress Database Table prefix.
 *
 * You can have multiple installations in one database if you give each
 * a unique prefix. Only numbers, letters, and underscores please!
 */
$table_prefix = 'wp_';

/**
 * For developers: WordPress debugging mode.
 *
 * Change this to true to enable the display of notices during development.
 * It is strongly recommended that plugin and theme developers use WP_DEBUG
 * in their development environments.
 *
 * For information on other constants that can be used for debugging,
 * visit the Codex.
 *
 * @link https://codex.wordpress.org/Debugging_in_WordPress
 */
define( 'WP_DEBUG', true );
define('WP_DEBUG_LOG', true);
define('WP_DEBUG_DISPLAY', true);
@ini_set('display_errors',0);

/* That's all, stop editing! Happy publishing. */

/** Absolute path to the WordPress directory. */
if ( ! defined( 'ABSPATH' ) ) {
	define( 'ABSPATH', dirname( __FILE__ ) . '/' );
}

/** Sets up WordPress vars and included files. */
require_once( ABSPATH . 'wp-settings.php' );

define('JWT_AUTH_CORS_ENABLE', true);