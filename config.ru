require 'rack'

use Rack::Static, :urls => Dir.glob("public/*").map { |fn| fn.gsub(/public/, '')},
                  :root => 'public',
                  :index =>'index.html',
                  :header_rules => [
                    [:all, {'Cache-Control' => 'public, max-age=864000'}],
                    [:all, {'Content-Type' => 'text/html'}],
                    [/^\/stylesheets/, {'Content-Type' => 'text/css'}]
                  ]

run lambda { |env|
  [
    200,
    {
      'Content-Type'  => 'text/html',
      'Cache-Control' => 'public, max-age=864000'
    },
    File.open('public/index.html', File::RDONLY)
  ]
}

