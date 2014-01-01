Puppet::Type.newtype(:ciscoucs_modify_serviceprofile_boot_policy) do
  @doc = 'Clone service profile on cisco ucs device'
  ensurable

 newparam(:serviceprofilename, :namevar => true) do
    desc "Name of server profile"
    validate do |value|
      if value && value.strip.length != 0
        unless value =~ /\A[a-zA-Z0-9\d_\.\:\-\/\s]{1,31}+\Z/
          raise ArgumentError, "%s is not a valid name." % value
        end
      end
    end
  end

  newparam(:serviceprofileorganization) do
    desc "Name of service profile organization"
    validate do |value|
      if value && value.strip.length != 0
        unless value =~ /\A[a-zA-Z0-9\d_\.\:\-\/\s]{1,31}+\Z/
          raise ArgumentError, "%s is not a valid name." % value
        end
      end
    end
  end

  newparam(:serviceprofiledn) do
    desc "Source server profile DN"
    validate do |value|
      if value  &&  value.strip.length != 0
        unless value =~ /\A[a-zA-Z0-9\d_\.\:\-\/\s]{1,31}+\Z/
          raise ArgumentError, "%s is not a valid value." % value
        end
      end
    end
  end

  newparam(:bootpolicyname) do
    desc "Name of boot policy"
    validate do |value|
      if value && value.strip.length != 0
        unless value =~ /\A[a-zA-Z0-9\d_\.\:\-\/\s]{1,31}+\Z/
          raise ArgumentError, "%s is not a valid name." % value
        end
      end
    end
  end

  newparam(:bootpolicyorganization) do
    desc "Name of boot policy organization"
    validate do |value|
      if value && value.strip.length != 0
        unless value =~ /\A[a-zA-Z0-9\d_\.\:\-\/\s]{1,31}+\Z/
          raise ArgumentError, "%s is not a valid name." % value
        end
      end
    end
  end

  newparam(:bootpolicydn) do
    desc "Boot policy DN"
    validate do |value|
      if value  &&  value.strip.length != 0
        unless value =~ /\A[a-zA-Z0-9\d_\.\:\-\/\s]{1,31}+\Z/
          raise ArgumentError, "%s is not a valid value." % value
        end
      end
    end
  end

  validate do
    if !self[:bootpolicydn] || self[:bootpolicydn].strip.length==0
      # if bootpolicydn is empty then both bootpolicyorganization and bootpolicyname should exists.
      if (!self[:bootpolicyorganization] || self[:bootpolicyorganization].strip.length == 0) || (!self[:bootpolicyname] || self[:bootpolicyname].strip.length == 0)
        raise ArgumentError, "Either dn or both organization and policy name should be given."
      end
    end
    if !self[:serviceprofiledn] || self[:serviceprofiledn].strip.length==0
          # if serviceprofiledn is empty then both serviceprofileorganization and serviceprofilename should exists.
          if (!self[:serviceprofileorganization] || self[:serviceprofileorganization].strip.length == 0) || (!self[:serviceprofilename] || self[:serviceprofilename].strip.length == 0)
            raise ArgumentError, "Either dn or both organization and profile name should be given."
          end
        end
        
  end

end
