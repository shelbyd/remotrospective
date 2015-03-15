class MainController < Volt::ModelController
  def index
  end

  def start_retro
    parameter_retro_name = parameterize(page._new_retro)
    store._retros.find({ parameter_name: parameter_retro_name }).then do |results|
      if results.size == 0
        new_retro = { name: page._new_retro, parameter_name: parameter_retro_name }
        store._retros << new_retro
      end
      go "/#{parameter_retro_name}"
    end
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
