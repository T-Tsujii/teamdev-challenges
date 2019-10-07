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

$(function () {
    // フォーム用の自作プラグイン

    // ボタンを通常表示に戻す
    $.fn.undoButton = function () {
        var value = $(this).data('value');
        $(this).prop('disabled', false).val(value);
    };
    // ボタンを押せない状態にする
    $.fn.errorButton = function (value) {
        $(this).prop('disabled', true).val(value);
    };
    // フォームが空であるインデックス配列を取得
    $.fn.emptyFormArray = function () {
        array = [];
        $(this).each(function (index, dom) {
            if ($(dom).val() === '') {
                array.push(index);
            }
        });
        return array;
    };
    // 両方入力されていないとき，ボタンを押せない状態にして，赤枠を表示する
    // 使用するときは，empty-check-1とempty-check-2をクラスを付与すること
    $.fn.onlyOneCheck = function (error_message) {
        var number_of_forms = $(this).find('.empty-check-1').length;
        var empty_subscripts_1 = $(this).find('.empty-check-1').emptyFormArray();
        var empty_subscripts_2 = $(this).find('.empty-check-2').emptyFormArray();
        // ボタン機能の有無
        if (empty_subscripts_1.join('') === empty_subscripts_2.join('')) {
            $(this).find('[type="submit"]').undoButton();
        } else {
            $(this).find('[type="submit"]').errorButton(error_message);
        }
        // 未入力フォームを赤枠に
        var error_subscripts_1 = empty_subscripts_1.filter(function (value) {
            return empty_subscripts_2.indexOf(value) === -1
        });
        var error_subscripts_2 = empty_subscripts_2.filter(function (value) {
            return empty_subscripts_1.indexOf(value) === -1
        });
        for (var i = 0; i < number_of_forms; i++) {
            if (error_subscripts_1.indexOf(i) >= 0) {
                $(this).find('.empty-check-1').eq(i).addClass('error-field');
            } else {
                $(this).find('.empty-check-1').eq(i).removeClass('error-field');
            }
            if (error_subscripts_2.indexOf(i) >= 0) {
                $(this).find('.empty-check-2').eq(i).addClass('error-field');
            } else {
                $(this).find('.empty-check-2').eq(i).removeClass('error-field');
            }
        }
    };
    // クリアボタンの表示・非表示機能
    $.fn.clearButton = function () {
        $(this).each(function (index, dom) {
            var visibility = ($(dom).val() === '') ? 'hidden' : 'visible';
            $(this).parent().find('span.clear-button').css('visibility', visibility);
        });
    };
    // ------------------------------------------------------------------------------
    // 入力値のクリアボタン機能
    $('.clear-button').on('click', function () {
        $(this).parent().find('input').val('');
        $(this).parent().find('span.clear-button').css('visibility', 'hidden');
    });
    // クリアボタンの表示・非表示
    $('input.site-form').on('blur', function () {
        $(this).clearButton();
    }).clearButton();
    // 送信ボタンのオン・オフ
    var site_error_message = 'サイト名とURLの両方を入力して下さい';
    $("input.site-form").on('focus', function () {
        $('#site-button').undoButton();
    }).on('blur', function () {
        $(this).closest('form').onlyOneCheck(site_error_message);
    });
    $('form#site-form .clear-button').on('click', function () {
        $(this).closest('form').onlyOneCheck(site_error_message);
    });
});