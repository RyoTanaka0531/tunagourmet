$(document).on('turbolinks:load', function(){
    // productの単価
    var value = JSON.parse(document.getElementById('product_price').dataset.json);
    // 入力対象のinputタグID名
    var tagInput = $('#order_count');
    // 出力対象のinputタグID名
    var tagOutput = $('#order_payment');
    tagInput.on('change', function(){
        var str = $(this).val();
        // 整数以外の文字列を削除
        var num = Number(str.replace(/[^0-9]/g, ''));
        if(num == 0){
            num = '';
        }
        // productと入力された数量の合計値
        $(this).val(num);
        if(num != 0){
            var order_payment = num * value;
            tagOutput.val(order_payment);
        }
    });
});