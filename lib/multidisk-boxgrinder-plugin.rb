require 'boxgrinder-build/plugins/base-plugin'

module BoxGrinder

  class MultiDiskPlugin < BasePlugin
    plugin :type => :platform, :name => :multidisk, :full_name  => "Multi Disk"

    def after_init
      register_deliverable(:vmdk_sparse => "#{@appliance_config.name}-sparse.vmdk")
      register_deliverable(:qcow_sparse => "#{@appliance_config.name}-sparse.qcow2")
      register_deliverable(:qcow_compressed => "#{@appliance_config.name}-compressed.qcow2")
      if !`which VBoxManage`.empty?
        register_deliverable(:vmdk_stream => "#{@appliance_config.name}-streamoptimized.vmdk")
        register_deliverable(:vhd => "#{@appliance_config.name}.vhd")
      end
    end

    def execute
      @log.info "Converting RAW to multiple disk formats"

      @log.info "Converting to VMDK Sparse using qemu-img..."
      @exec_helper.execute "qemu-img convert -O vmdk '#{@previous_deliverables.disk}' '#{@deliverables.vmdk_sparse}'"

      @log.info "Converting to QCow2 Sparse using qemu-img..."
      @exec_helper.execute "qemu-img convert -O qcow2 '#{@previous_deliverables.disk}' '#{@deliverables.qcow_sparse}'"

      @log.info "Converting to QCow2 Compressed Sparse using qemu-img..."
      @exec_helper.execute "qemu-img convert -c -O qcow2 '#{@previous_deliverables.disk}' '#{@deliverables.qcow_compressed}'"

      if `which VBoxManage`.empty?
        @log.error "VBoxManage binary not found in your path, skipping VMDK Stream format."
      else
        @log.info "Using VBoxManage to convert the image..."
        @log.info "Converting to VMDK..."
        @exec_helper.execute "VBoxManage clonehd --format VMDK --variant Stream '#{@deliverables.vmdk_sparse}' '#{@deliverables.vmdk_stream}'"
        @log.info "Converting to VHD..."
        @exec_helper.execute "VBoxManage clonehd --format VHD '#{@deliverables.vmdk_sparse}' '#{@deliverables.vhd}'"
      end

      @log.info "Conversions done."
    end

  end

end
