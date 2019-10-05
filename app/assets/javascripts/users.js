// 送信ボタンのオン・オフ
$(function () {
    $("input.site_form").on('input', function () {
        $('#site-button').prop('disabled', false);
    }).on('change', function () {
        var empty_name_subscripts = '';
        var empty_url_subscripts = '';
        $("input.site_name").each(function (index, dom) {
            if ($(dom).val() === '') {
                empty_name_subscripts += index;
            }
        });
        $("input.site_url").each(function (index, dom) {
            if ($(dom).val() === '') {
                empty_url_subscripts += index;
            }
        });
        var is_button_enabled = empty_name_subscripts !== empty_url_subscripts;
        $('#site-button').prop('disabled', is_button_enabled);
    });
});

// 入力値のクリアボタン機能
$(function () {
    $('.clear-button').on('click', function () {
        $(this).parent().find('input').val('');
        $(this).parent().find('span.clear-button').css('visibility', 'hidden');
        $("input.site_form").change();
    });
});

// クリアボタンの表示・非表示
$(function () {
    $("input.site_form").on('change', function () {
        $(this).each(function (index, dom) {
            var visibility = ($(dom).val() === '') ? 'hidden' : 'visible';
            $(this).parent().find('span.clear-button').css('visibility', visibility);
        });
    }).change();
});