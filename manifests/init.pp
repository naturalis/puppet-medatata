# Class: metadata
# ===========================
#
# Adding metadata to custom facts 
#
# Parameters
# ----------
#
# ensure_directories  create directories in which the json file will be set
# metadata  the data 
#
# Authors
# -------
#
# Author Name <hugo.vanduijn@naturalis.nl>
#
class metadata (
  $ensure_directories   = ['/etc/facter','/etc/facter/facts.d'],
  $metadata = '{
    "metadata_application":"Generic linux application",
    "metadata_component":"Webserver",
    "metadata_description":"No description", 
    "metadata_status":"Production",
    "metadata_systemowner":"ICT Infra",
    "metadata_client":"Naturalis",
    "metadata_topdesk":"M0000000",
    "metadata_dnsnames":["www.url.nl","url.nl"]
  }'
)
{
  file { $ensure_directories:
    ensure             => directory,
    mode               => '0755',
  }

  file { '/etc/facter/facts.d/metadata.json':
    ensure             => file,
    mode               => '0644',
    content            => $metadata,
    require            => File[$ensure_directories]
  }

}
