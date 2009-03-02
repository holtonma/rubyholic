# Methods added to this helper will be available to all templates in the application.
module ApplicationHelper
  
  def sortable_heading( label, field, make_link )
    up_params = { :order => field, :direction => 'asc' }
    down_params = { :order => field, :direction => 'desc' }
    "%s #{label} %s" % [
      link_to( '^', make_link.call( up_params ) ),
      link_to( 'v', make_link.call( down_params ) )
    ]
  end
  
end
