require 'jrubyfx'
require 'jrubyfx-fxmlloader'
require 'hawkular_all'

require_relative 'hawk_helper'
require_relative 'h_tree_item'
require_relative 'alert_controller'
require_relative 'on_click_cell_factory'

  class HawkFxController
    include JRubyFX::Controller
    fxml 'fxmain.fxml'


    def show_initial_tree(feeds)

      @FXMLtreeView.setCellFactory proc { ::OnClickCellFactory.new }

      tree_root = tree_item('Feeds')
      feeds.each do |feed|
        iv = ::HawkHelper.create_icon 'F'

        new_feed = build(::HTreeItem)
        new_feed.kind = :feed
        new_feed.value = feed
        new_feed.graphic = iv

        tree_root.children.add new_feed
        puts new_feed.to_s
      end
      # bind to the view from fxml
      @FXMLtreeView.setRoot(tree_root)
      $FXMLChart = @FXMLChart
      $FXMLSingleChart = @FXMLSingleChart

      tree_root.expanded=true
    end

    # Load the alerts window
    def show_alerts
      popup_stage = Stage.new
      ::AlertController.load_into popup_stage
      popup_stage.title="Alerts & Definitions"
      popup_stage.init_modality=:none
      popup_stage.init_owner(@FXMLtreeView.scene.window)
      popup_stage.show
    end
  end