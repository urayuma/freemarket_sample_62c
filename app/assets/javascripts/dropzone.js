$(document).on('turbolinks:load', function(){
  var dropzone = $('.dropzone-area');
  var dropzone2 = $('.dropzone-area2');
  var dropzone_box = $('.dropzone-box');
  var images = [];
  var inputs  =[];
  var input_area = $('.input_area');
  var preview = $('#preview');
  var preview2 = $('#preview2');

  function appendPreview1(index,url){
    var previewHtml = `<div class="img_view" data-image="${index}"><img src="${url}">
                <div class="btn_wrapper">
                <div class="btn delete">削除
                </div>
                </div>
                </div>`;
  $('#preview').append(previewHtml);
  return previewHtml;
  };

  function appendPreview2(index,url){
    var previewHtml = `<div class="img_view" data-image="${index}"><img src="${url}">
                <div class="btn_wrapper">
                <div class="btn delete">削除</div>
                </div>
                </div>`;
  $('#preview2').append(previewHtml);
  return previewHtml;
  };


  $(document).on('change', 'input[type= "file"].upload-image',function(event) {
    var file = $(this).prop('files')[0];
    var reader = new FileReader();
    inputs.push($(this));
    var img = $(`<div class= "img_view"><img></div>`);
    reader.onload = function(e) {
      var btn_wrapper = $('<div class="btn_wrapper"><div class="btn delete">削除</div></div>');
      img.append(btn_wrapper);
      img.find('img').attr({
        src: e.target.result
      })
    }
    reader.readAsDataURL(file);
    images.push(img);

    if(images.length >= 5) {
      dropzone2.css({
        'display': 'block'
      })
      dropzone.css({
        'display': 'none'
      })
      preview.children().remove();
      preview2.children().remove();
      $.each(images, function(index, image) {
        $(image).attr('data-image', index);
        if(index < 5){
          preview.append(image);
        }else{
          preview2.append(image);
        }
      })
      dropzone2.css({
        'width': `calc(100% - (124px * ${images.length - 5}))`
      })
      if(images.length == 9) {
        dropzone2.find('p').replaceWith('<i class="fa fa-camera image-input-icon"></i>')
      }
    } else {
        preview.children().remove();
        preview2.children().remove();
        $.each(images, function(index, image) {
          $(image).attr('data-image', index);
          if(index < 5){
            preview.append(image);
          }else{
            preview2.append(image);
          }
        })
        dropzone.css({
          'width': `calc(100% - (124px * ${images.length}))`
        })
      }
      if(images.length == 4) {
        dropzone.find('p').replaceWith('<i class="fa fa-camera image-input-icon"></i>')
      }
    if(images.length == 10) {
      dropzone2.css({
        'display': 'none'
      })
      dropzone.css({
        'display': 'none'
      })
      return;
    }
    var new_image = $(`<input multiple= "multiple" name="images[image][]" class="upload-image" data-image= ${images.length-1} type="file" id="upload-image">`);
    input_area.prepend(new_image);
  });

  $(document).on('click', '.delete', function() {
    var target_image = $(this).parent().parent();
    $.each(inputs, function(index, input){
      if ($(this).data('image') == target_image.data('image')){
        $(this).remove();
        target_image.remove();
        var num = $(this).data('image');
        images.splice(num, 1);
        inputs.splice(num, 1);
        if(inputs.length == 0) {
          $('input[type= "file"].upload-image').attr({
            'data-image': inputs.length
          });
        }
      }
    })
    $('input[type= "file"].upload-image:first').attr({
      'data-image': inputs.length
    })
    $.each(inputs, function(index, input) {
      var input = $(this);
      input.attr({
        'data-image': index
      });
      $('input[type= "file"].upload-image:first').after(input)
    })

    var resultImages = [];
    $.each(images, function(index, image) {
      image = $(image).attr(
        'data-image', index
      );
      resultImages.push(image);
    })

    if (resultImages.length >= 5) {
      dropzone.css({
        'display': 'none'
      })
      dropzone2.css({
        'display': 'block'
      })
      preview.children().remove();
      preview2.children().remove();
      $.each(resultImages, function(index, image) {
        image = $(image).attr('data-image', index);
        if(index < 5){
          preview.append(image);
        }else{
          preview2.append(image);
        }
      })
      dropzone2.css({
        'width': `calc(100% - (124px * ${resultImages.length - 5}))`
      })
      if(resultImages.length == 9) {
        dropzone2.find('p').replaceWith('<i class="fa fa-camera"></i>')
      }
      if(resultImages.length == 8) {
        dropzone2.find('i').replaceWith('<p>ココをクリックしてください</p>')
      }
    } else {
      dropzone.css({
        'display': 'block'
      })
      dropzone2.css({
        'display': 'none'
      })
      preview.children().remove();
      $.each(resultImages, function(index, image) {
        $(image).attr('data-image', index);
        if(index < 5){
          preview.append(image);
        }else{
          preview2.append(image);
        }
      })
      dropzone.css({
        'width': `calc(100% - (124px * ${images.length}))`
      })
    if(resultImages.length == 4) {
      dropzone.find('p').replaceWith('<i class="fa fa-camera"></i>')
      dropzone2.css({
        'display': 'none'
      })
    }
    if(resultImages.length == 3) {
      dropzone.find('i').replaceWith('<p>ココをクリックしてください</p>')
    }
  }
  })

    // 編集ページ読み込み時に発火
    $(window).on('load', function() {
      itemId = $('#item-id').data('id');
      if (itemId != null){
        $.ajax({
          url: '/items/get_image',
          type: 'GET',
          data: { item_id: itemId },
          dataType: 'json'
        })
        .done(function(ArrayImages){
          $.each(ArrayImages,function(index,image){
            var file = image.image.url;
            if(index < 5){
              images.push(appendPreview1(index,file));
            }else{
              images.push(appendPreview2(index,file));
            }
            var new_image = $(`<input multiple= "multiple" name="images[image][]" class="upload-image" data-image= ${images.length-1} type="text" id="upload-image" value="${image.image.url}">`);

            input_area.prepend(new_image);
            inputs.push(new_image);
          });
  
          if(images.length >= 5) {
            dropzone2.css({
              'display': 'block'
            })
            dropzone.css({
              'display': 'none'
            })
            dropzone2.css({
              'width': `calc(100% - (124px * ${images.length - 5}))`
            })
            if(images.length == 9) {
              dropzone2.find('p').replaceWith('<i class="fa fa-camera image-input-icon"></i>')
            }
          } else {
              $('#preview').empty();
              $.each(images, function(index, image) {
                $(image).attr('data-image', index);
                preview.append(image);
              })
              dropzone.css({
                'width': `calc(100% - (124px * ${images.length}))`
              })
            }
            if(images.length == 4) {
              dropzone.find('p').replaceWith('<i class="fa fa-camera image-input-icon"></i>')
            }
          if(images.length == 10) {
            dropzone.css({
              'display': 'none'
            })
            dropzone2.css({
              'display': 'none'
            })
            input_area.css({
              'display':'none'
            })
            
            return;
          }
        })
        .fail(function(){
          alert('画像の取得に失敗しました');
        })
      }
    })


    $('#edit-submit').click(function(e){
      e.preventDefault();
      var formData = new FormData($(this).get(0));
      console.log(formData);


    })

});