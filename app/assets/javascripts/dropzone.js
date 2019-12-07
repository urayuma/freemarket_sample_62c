$(document).on("turbolinks:load", function() {
  var dropzone = $(".dropzone-area");
  var dropzone2 = $(".dropzone-area2");
  var images = [];
  var inputs = [];
  var input_area = $(".input_area");
  var preview = $("#preview");
  var preview2 = $("#preview2");
  var defaultInput = [];
  var i = 0;

  function appendPreview(index) {
    var previewHtml = $(`<div class="img_view" data-image="${index}"><img>
                <div class="btn_wrapper">
                <div class="btn delete">削除
                </div>
                </div>
                </div>`);
    return previewHtml;
  }

  function appendPreview1(index, url, id) {
    var previewHtml = $(`<div class="img_view" data-image="${index}" data-id="${id}"><img src="${url}">
                <div class="btn_wrapper">
                <div class="btn delete">削除
                </div>
                </div>
                </div>`);
    $("#preview").append(previewHtml);
    return previewHtml;
  }

  function appendPreview2(index, url, id) {
    var previewHtml = $(`<div class="img_view" data-image="${index}" data-id="${id}"><img src="${url}">
                <div class="btn_wrapper">
                <div class="btn delete">削除</div>
                </div>
                </div>`);
    $("#preview2").append(previewHtml);
    return previewHtml;
  }

  $(document).on("change", 'input[type= "file"].upload-image', function(event) {
    var file = $(this).prop("files")[0];
    var reader = new FileReader();
    inputs.push($(this));
    var img = appendPreview(i);
    reader.onload = function(e) {
      img.find("img").attr({
        src: e.target.result
      });
    };
    reader.readAsDataURL(file);
    images.push(img);

    if (images.length >= 5) {
      dropzone2.css({
        display: "block"
      });
      dropzone.css({
        display: "none"
      });
      preview.children().remove();
      preview2.children().remove();
      $.each(images, function(index, image) {
        if (index < 5) {
          preview.append(image);
        } else {
          preview2.append(image);
        }
      });
      dropzone2.css({
        width: `calc(100% - (124px * ${images.length - 5}))`
      });
      if (images.length == 9) {
        dropzone2
          .find("p")
          .replaceWith('<i class="fa fa-camera image-input-icon"></i>');
      }
    } else {
      preview.children().remove();
      preview2.children().remove();
      $.each(images, function(index, image) {
        if (index < 5) {
          preview.append(image);
        } else {
          preview2.append(image);
        }
      });
      dropzone.css({
        width: `calc(100% - (124px * ${images.length}))`
      });
    }
    if (images.length == 4) {
      dropzone
        .find("p")
        .replaceWith('<i class="fa fa-camera image-input-icon"></i>');
    }
    if (images.length == 10) {
      dropzone2.css({
        display: "none"
      });
      dropzone.css({
        display: "none"
      });
      return;
    }
    i += 1;
    var new_image = $(
      `<input multiple= "multiple" name="images[image][]" class="upload-image" data-image= ${i} type="file" id="upload-image">`
    );
    input_area.prepend(new_image);
  });

  $(document).on("click", ".delete", function() {
    var target_image = $(this)
      .parent()
      .parent();
    $.each(images, function(index, image) {
      if (image.attr("data-image") == target_image.data("image")) {
        images_index = index;
      }
    });
    $.each(inputs, function(index, input) {
      if ($(this).data("image") == target_image.data("image")) {
        inputs_index = index;
        $(this).remove();
        target_image.remove();
        images.splice(images_index, 1);
        inputs.splice(inputs_index, 1);
      }
    });
    $.each(defaultInput, function(index, input) {
      if (input == target_image.data("id")) {
        target_image.remove();
        defaultInput.splice(
          $.inArray(target_image.data("id"), defaultInput),
          1
        );
        images.splice(images_index, 1);
      }
    });

    if (inputs.length == 0) {
      input_area.children().remove();
      i += 1;
      var new_image = $(
        `<input multiple= "multiple" name="images[image][]" class="upload-image" data-image= ${i} type="file" id="upload-image">`
      );
      input_area.prepend(new_image);
    }

    if (images.length >= 5) {
      dropzone.css({
        display: "none"
      });
      dropzone2.css({
        display: "block"
      });
      preview.children().remove();
      preview2.children().remove();
      $.each(images, function(index, image) {
        if (index < 5) {
          preview.append(image);
        } else {
          preview2.append(image);
        }
      });
      dropzone2.css({
        width: `calc(100% - (124px * ${images.length - 5}))`
      });
      if (images.length == 9) {
        dropzone2.find("p").replaceWith('<i class="fa fa-camera image-input-icon"></i>');
      }
      if (images.length == 8) {
        dropzone2
          .find("i")
          .replaceWith(
            '<p class="input-area-text">ここをクリックしてください</p>'
          );
      }
    } else {
      dropzone.css({
        display: "block"
      });
      dropzone2.css({
        display: "none"
      });
      preview.children().remove();
      $.each(images, function(index, image) {
        if (index < 5) {
          preview.append(image);
        } else {
          preview2.append(image);
        }
      });
      dropzone.css({
        width: `calc(100% - (124px * ${images.length}))`
      });
      if (images.length == 4) {
        dropzone.find("p").replaceWith('<i class="fa fa-camera image-input-icon"></i>');
        dropzone2.css({
          display: "none"
        });
      }
      if (images.length == 3) {
        dropzone
          .find("i")
          .replaceWith(
            '<p class="input-area-text">ここをクリックしてください</p>'
          );
      }
    }
  });

  // 編集ページ読み込み時に発火
  $(window).on("load", function() {
    itemId = $("#item-id").data("id");
    if (itemId != null) {
      $.ajax({
        url: "/items/get_image",
        type: "GET",
        data: { item_id: itemId },
        dataType: "json"
      })
        .done(function(ArrayImages) {
          $.each(ArrayImages, function(index, image) {
            var file = image.image.url;
            if (index < 5) {
              images.push(appendPreview1(i, file, image.id));
            } else {
              images.push(appendPreview2(i, file, image.id));
            }
            defaultInput.push(image.id);
            i += 1;
          });

          if (images.length >= 5) {
            dropzone2.css({
              display: "block"
            });
            dropzone.css({
              display: "none"
            });
            dropzone2.css({
              width: `calc(100% - (124px * ${images.length - 5}))`
            });
            if (images.length == 9) {
              dropzone2
                .find("p")
                .replaceWith('<i class="fa fa-camera image-input-icon"></i>');
            }
          } else {
            dropzone.css({
              width: `calc(100% - (124px * ${images.length}))`
            });
          }
          if (images.length == 4) {
            dropzone
              .find("p")
              .replaceWith('<i class="fa fa-camera image-input-icon"></i>');
          }
          if (images.length == 10) {
            dropzone.css({
              display: "none"
            });
            dropzone2.css({
              display: "none"
            });
            input_area.css({
              display: "none"
            });
            return;
          }
          $('input[type= "file"].upload-image:first').attr({
            "data-image": i
          });
        })
        .fail(function() {
          alert("画像の取得に失敗しました");
        });
    }

    $("#edit-submit").click(function(e) {
      e.preventDefault();
      var formData = new FormData($("#item-dropzone").get(0));
      if (defaultInput.length == 0) {
      } else {
        defaultInput.forEach(function(image) {
          formData.append("images[image][]", image);
        });
      }
      itemId = $("#item-id").data("id");

      for (let value of formData.entries()) {
      }

      $.ajax({
        url: "/items/" + itemId,
        type: "PATCH",
        data: formData,
        contentType: false,
        processData: false,
        dataType: "text"
      })
        .done(function() {
          window.location.href = "/mypage/" + itemId + "/exhibit_item";
        })
        .fail(function() {
          alert("更新に失敗しました");
        });
    });
  });
});
