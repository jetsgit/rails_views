module ApplicationHelper
  def markdown(text)
    render_options = {
      # will remove from the output HTML tags inputted by user 
      filter_html:     true,

      # will insert <br /> tags in paragraphs where are newlines 
      # (ignored by default)
      hard_wrap:       true, 

      # hash for extra link options, for example 'nofollow'
      link_attributes: { rel: 'nofollow' }

      # will remove <img> tags from output
      # no_images: true
      
      # will remove <a> tags from output
      # no_links: true

      # will remove <style> tags from output
      # no_styles: true

      # Escape any html tags. This has precedence over no_styles:
      # escape_html: true

      # generate links for only safe protocols
      # safe_links_only: true

      # Add HTML anchors to each header in the output HTML, to allow
      # linking to each section.
      # with_toc_data: true

      # Output XHTML-conformant tags. This option is always enabled in the
      # Render::XHTML renderer
      # xhtml: true

      # Add prettyprint classes to <code> tags for google-code-prettify
      # prettify: true
    }
    renderer = Redcarpet::Render::HTML.new(render_options)

    extensions = {
      #will parse links without need of enclosing them
      autolink:           true,

      # blocks delimited with 3 ` or ~ will be considered as code block. 
      # No need to indent.  You can provide language name too.
      # ```ruby
      # block of code
      # ```
      fenced_code_blocks: true,

      # will ignore standard require for empty lines surrounding HTML blocks
      lax_spacing:        true,

      # will not generate emphasis inside of words, for example no_emph_no
      no_intra_emphasis:  true,

      # will parse strikethrough from ~~, for example: ~~bad~~
      strikethrough:      true,

      # will parse superscript after ^, you can wrap superscript in () 
      superscript:        true,

      # will require a space after # in defining headers
      # space_after_headers: true

      # parse tables, PHP-Markdown style
      # tables: true

      # Do not parse usual markdown code blocks. Markdown converts text with
      # four spaces at the front of each lne to code blocks. This option
      # prevents it from doing so. Recommended to use with 
      # fenced_code_blocks: true
      disable_indented_code_blocks: true

      # A space is always required beween the hash at the beginning of a
      # header and its name, e.g. '#this is my header' would not be a valid header
      # space_after_headers: true

      # Parse underscored emphasis as underlines. This is '_underlined_' but this is 
      # still *italic*
      # underline: true

      # Parse highlights.  This is '==highlighted text==' It looks like this
      # <mark>highlighted text</mark>
      # highlight: true

      # Parse quotes. This is a '"quote text"' It looks like <q>quote text</q>
      # quote: true
    }
    
    Redcarpet::Markdown.new(renderer, extensions).render(text).html_safe
  end
end
