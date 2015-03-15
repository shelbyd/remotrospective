class MainController < Volt::ModelController
  def index
  end

  def start_retro
    new_retro = { name: page._new_retro, parameter_name: parameterize(page._new_retro) }
    store._retros << new_retro
    go "/#{new_retro[:parameter_name]}"
  end

  private

  def parameterize(string)
    string.strip
      .gsub(/['`]/,"")
      .gsub(/\s*@\s*/, " at ")
      .gsub(/\s*&\s*/, " and ")
      .gsub(/\s*[^A-Za-z0-9\.\-]\s*/, '_'  )
      .gsub(/_+/,"_")
      .gsub(/\A[_\.]+|[_\.]+\z/,"")
  end

  # The main template contains a #template binding that shows another
  # template.  This is the path to that template.  It may change based
  # on the params._controller and params._action values.
  def main_path
    params._controller.or('main') + '/' + params._action.or('index')
  end

  # Determine if the current nav component is the active one by looking
  def active_tab?
    url.path.split('/')[1] == attrs.href.split('/')[1]
  end
end
  # at the first part of the url against the href attribute.
