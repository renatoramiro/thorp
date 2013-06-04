jQuery ->
  if $('.pagination').length
    $(window).scroll ->
      url = $('.pagination .next_page').attr('href')
      if url && $(window).scrollTop() > $(document).height() - $(window).height() - 190
        gif = '<img src="assets/loading.gif"/>'
        $('.pagination').html("Carregando mais posts"+gif)
        $.getScript(url)
    $(window).scroll()