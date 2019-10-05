// This is a manifest file that'll be compiled into application.js, which will include all the files
// listed below.
//
// Any JavaScript/Coffee file within this directory, lib/assets/javascripts, or any plugin's
// vendor/assets/javascripts directory can be referenced here using a relative path.
//
// It's not advisable to add code directly here, but if you do, it'll appear at the bottom of the
// compiled file. JavaScript code in this file should be added after the last require_* statement.
//
// Read Sprockets README (https://github.com/rails/sprockets#sprockets-directives) for details
// about supported directives.
//
//= require rails-ujs
//= require activestorage
//= require jquery3

$(function() {
    $("input.site_form").focus(function() {
        $('#site_button').prop('disabled', false);
    }).blur(function() {
        let empty_name_subscripts = '';
        $("input.site_name").each(function(index, dom) {
            if ($(dom).val() === '') {
                empty_name_subscripts += index;
            }
        });
        let empty_url_subscripts = '';
        $("input.site_url").each(function(index, dom) {
            if ($(dom).val() === '') {
                empty_url_subscripts += index;
            }
        });
        if (empty_name_subscripts !== empty_url_subscripts) {
            $('#site_button').prop('disabled', true);
        }
    });
});