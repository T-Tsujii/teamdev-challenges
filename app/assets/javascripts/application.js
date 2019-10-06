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
//= require turbolinks
//= require_tree .

// 入力値のクリアボタン機能
$(function () {
    $('.clear-button').on('click', function () {
        $(this).parent().find('input').val('');
        $(this).parent().find('span.clear-button').css('visibility', 'hidden');
    });
});

// クリアボタンの表示・非表示
$(function () {
    $('input.site-form').on('change', function () {
        $(this).each(function (index, dom) {
            var visibility = ($(dom).val() === '') ? 'hidden' : 'visible';
            $(this).parent().find('span.clear-button').css('visibility', visibility);
        });
    }).change();
});