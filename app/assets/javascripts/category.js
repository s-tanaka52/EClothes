(function() {
  function appendOption(category) {
    let html = `<option value='${category.id}' data-category='${category.id}'>${category.name}</option>`;
    return html;
  }

  function appendChildrenBox(insertHTML) {
    let childrenSelectHtml = '';
    childrenSelectHtml = `
      <div id='children-wrapper'>
        <select id='children-category' class='form-control' name='[children_id]'>
          <option value='---' data-category='---'>---</option>
          ${insertHTML}
        </select>
        <i class='fas fa-chevron-down'></i>
      </div>
    `;
    console.log(childrenSelectHtml)
    ('.category-form').append(childrenSelectHtml);
  }

  function appendGrandchildrenBox(insertHTML) {
    let grandchildrenSelectHtml = '';
    grandchildrenSelectHtml = `
      <div id='grandchildren-wrapper'>
        <select id='grandchildren-category' class='form-control' name='[grandchildren_id]'>
          <option value='---' data-category='---'>---</option>
          ${insertHTML}
        </select>
        <i class='fas fa-chevron-down'></i>
      </div>
    `;
    ('.category-form').append(grandchildrenSelectHtml);
  }

  ('#parent-category').on('change', function() {
    let parentId = document.getElementById('parent-category').value;
    if (parentId != '---') {
      $.ajax({
        url: 'get_category/children',
        type: 'GET',
        data: {
          parent_id: parentId,
        },
        dataType: 'json',
      })
        .done(function(children) {
          console.log(children)
          ('#children-wrapper').remove();
          ('#grandchildren-wrapper').remove();
          let insertHTML = '';
          children.forEach(function(children) {
            insertHTML += appendOption(children);
          });
          console.log(insertHTML)
          appendChildrenBox(insertHTML);
        })
        .fail(function() {
          alert('ジャンル取得に失敗しました');
        });
    } else {
      ('#children-wrapper').remove();
      ('#grandchildren-wrapper').remove();
    }
  });

  ('.category-form').on('change', '#children-category', function() {
    let childrenId = ('#children-category option:selected').data('category');
    if (childrenId != '---') {
      $.ajax({
        url: 'get_category/grandchildren',
        type: 'GET',
        data: {
          children_id: childrenId,
        },
        dataType: 'json',
      })
        .done(function(grandchildren) {
          if (grandchildren.length != 0) {
            ('#grandchildren-wrapper').remove();
            let insertHTML = '';
            grandchildren.forEach(function(grandchildren) {
              insertHTML += appendOption(grandchildren);
            });
            appendGrandchildrenBox(insertHTML);
          }
        })
        .fail(function() {
          alert('ジャンル取得に失敗しました');
        });
    } else {
      ('#grandchildren-wrapper').remove();
    }
  });
});