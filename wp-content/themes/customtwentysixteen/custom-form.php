<?php /* Template Name: custom-form */?>

<?php get_header();?>

<div id="primary" class="content-area">
    <main id="main" class="site-main" role="main">
        <h3>Offer news here on any theme.</h3>
        <form enctype="multipart/form-data" action="<?php echo esc_url( admin_url('admin-post.php') ); ?>"
            method="post">
            <label>Name<input type="text" name="name"></label>
            <label>Email<input type="email" name="email"></label>
            <label>Topic<input type="text" name="topic"></label>
            Enter your message here:
            <textarea id="" cols="30" rows="10" name="meta"></textarea>
            Category<select name="category">
                <option value="Travel">Travel</option>
                <option value="Psyhology">Psyhology</option>
                <option value="Relationship">Relationship</option>
                <option value="Sport">Sport</option>
            </select>
            <br>
            <input type="file" name="media" style="margin:1rem 0;">
            <!-- <?php wp_nonce_field( 'my_image_upload', 'my_image_upload_nonce' ); ?> -->
            <br>
            <input type="hidden" name="action" value="news_form">
            <input type="submit">
        </form>
    </main>
    <?php get_sidebar('content-bottom');?>
</div>
<?php get_sidebar();?>
<?php get_footer();?>