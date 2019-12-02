$(document).on("turbolinks:load", function() {
  // カテゴリーセレクトボックスのオプションを作成
  function appendOption(category) {
    var html = `<option value="${category.id}">${category.name}</option>`;
    return html;
  }
  // 子カテゴリーの表示作成
  function appendChidrenBox(insertHTML, parentCategory) {
    console.log(parentCategory);
    var childSelectHtml = "";
    childSelectHtml = `<div class="children-wrapper-search">
                        <select id="select-children-category-search" name="q[category_id_eq_any]"><option value="${parentCategory}">すべて</option>
                          ${insertHTML}
                        </select>
                       </div>`;
    $(".category-wrapper-search").append(childSelectHtml);
  }
  // 孫カテゴリーの表示作成
  function appendGrandchidrenBox(insertHTML) {
    var grandchildSelectHtml = "";
    grandchildSelectHtml = `<div class="grandchildren-wrapper-search">
                              <input id="select-grandchildren-category" type="checkbox"  value="${insertHTML.id}" name="q[category_id_in][]">
                              <label for="select-grandchildren-category-search">
                                ${insertHTML.name}
                              </label>
                            </div>`;
    $(".category-wrapper-search").append(grandchildSelectHtml);
  }

  // 親カテゴリー選択後のイベント
  $("#select-parent-category-search").on("change", function() {
    var parentCategory = document.getElementById(
      "select-parent-category-search"
    ).value; //選択された親カテゴリーの名前を取得
    if (parentCategory != "") {
      //親カテゴリーが初期値でないことを確認
      $.ajax({
        url: "get_category_children",
        type: "GET",
        data: { parent_id: parentCategory },
        dataType: "json"
      })
        .done(function(children) {
          $(".children-wrapper-search").remove(); //親が変更された時、子以下を削除するする
          $(".grandchildren-wrapper-search").remove();
          var insertHTML = "";
          children.forEach(function(child) {
            insertHTML += appendOption(child);
          });
          appendChidrenBox(insertHTML, parentCategory);
        })
        .fail(function() {
          alert("カテゴリー取得に失敗しました");
        });
    } else {
      $(".children-wrapper-search").remove(); //親カテゴリーが初期値になった時、子以下を削除するする
      $(".grandchildren-wrapper-search").remove();
    }
  });
  // 子カテゴリー選択後のイベント
  $(document).on("change", "#select-children-category-search", function() {
    var childId = $("#select-children-category-search").val(); //選択された子カテゴリーのidを取得
    if (childId != "") {
      //子カテゴリーが初期値でないことを確認
      $.ajax({
        url: "get_category_grandchildren",
        type: "GET",
        data: { child_id: childId },
        dataType: "json"
      })
        .done(function(grandchildren) {
          if (grandchildren.length != 0) {
            $(".grandchildren-wrapper-search").remove(); //子が変更された時、孫以下を削除する
            var insertHTML = "";
            grandchildren.forEach(function(grandchild) {
              appendGrandchidrenBox(grandchild);
            });
          }
        })
        .fail(function() {
          alert("カテゴリー取得に失敗しました");
        });
    } else {
      $(".grandchildren-wrapper-search").remove(); //子カテゴリーが初期値になった時、孫以下を削除する
    }
  });
});
