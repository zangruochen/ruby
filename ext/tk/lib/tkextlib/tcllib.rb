#
#  tcllib extension support
#                               by Hidetoshi NAGAI (nagai@ai.kyutech.ac.jp)
#

require 'tk'

# call setup script for general 'tkextlib' libraries
require 'tkextlib/setup.rb'

# call setup script
require 'tkextlib/tcllib/setup.rb'

err = ''

# package:: autoscroll
target = 'tkextlib/tcllib/autoscroll'
begin
  require target
rescue => e
  err << "\n  ['" << target << "'] "  << e.class.name << ' : ' << e.message
end

# package:: cursor
target = 'tkextlib/tcllib/cursor'
begin
  require target
rescue => e
  err << "\n  ['" << target << "'] "  << e.class.name << ' : ' << e.message
end

# package:: style
target = 'tkextlib/tcllib/style'
begin
  require target
rescue => e
  err << "\n  ['" << target << "'] "  << e.class.name << ' : ' << e.message
end

# autoload
module Tk
  module Tcllib
    # package:: ctext
    autoload :CText,      'tkextlib/tcllib/ctext'

    # package:: datefield
    autoload :Datefield,  'tkextlib/tcllib/datefield'
    autoload :DateField,  'tkextlib/tcllib/datefield'

    # package:: ipentry
    autoload :IP_Entry,   'tkextlib/tcllib/ip_entry'

    # package:: Plotchart
    autoload :Plotchart,  'tkextlib/tcllib/plotchart'

    # package:: tkpiechart
    autoload :Tkpiechart, 'tkextlib/tcllib/tkpiechart'
  end
end

unless err.empty?
  warn("Warning: some sub-packages are failed to require : " + err)
end

