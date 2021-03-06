# <%= name.capitalize %>

## Getting Started

Install QAble and their dependencies if you  haven't yet:

```
bundle install
```

With the dependencies installed you can proceed to run tests.

## Configuration

The project is configured through the `config.yml` file in the root directory.
see this file for all the values that can be configured and examples about how
to set them.

## Browsers Support

QAble supports Chrome and Firefox by default in all the OS supported by Selenium (OS X, Linux, Windows, ...)
without installing any extra dependencies if the browsers are installed (e.g you need to install Firefox to run tests in Firefox).

Tests can be executed in Internet Explorer and Edge if a Windows Machine with Selenium
Server is set and configured. (instructions about setting a server are below in the `Windows Browsers support through Selenium Server` section)

Safari support under OS X is under work.

Internet Explorer and Edge under Windows will be supported soon.

## Running tests

```
bundle exec rake
```

By default tests are run in all supported browsers to change that edit
the `config.yml` in project directory.

The results of the tests are displayed in console and saved to `reports`
folder on the project.

## Available Steps

By default Qable include a set of tests useful for testing the behavior
of web sites. See the [Web Steps file](https://github.com/ableco/qable/blob/master/lib/qable/step_definitions/web_steps.rb)
to learn about the available stepts.

## Referencing Paths

Paths can be referenced by url or name in features files.

To specify paths by url just puth the url that you want to visit, e.g:

```
Given I go to /sign_in
```

To specify paths by name add the alias in paths section in the `config.yml`:

```
paths
  login: /sign_in
```

and reference it in the feature file:

```
Given I go to login page
```

## Adding custom step definitions

Custom step definitions can be added in the `features/step_definitions` folder
in the project. By default `custom_steps.rb` file lives in this folder
and can be edited to add the new steps.

## Visualizing Failing tests

The screenshots for failing tests are saved by default in `reports`
folder and displayed in the corresponding report file along with the failing
step.

## Page Object Support

Page Object Model DSL is supported if the `site_prism` gem is added to the
project's Gemfile.

To use Page Object Model just add the Ruby files describing the site to
the `page_objects` folder in the project.

Check [SitePrism](https://github.com/natritmeyer/site_prism#siteprism)
for more details about using Page Object Model DSL.

## Windows Browsers support through Selenium Server

QAble can be used with Selenium Server to run tests in Windows for browsers not
supported by OS X.

The next steps can be executed in a Windows machine to configure Selenium Server
along with IE driver and Edge's Web Driver for Selenium:

First download `selenium-server-standalone` and `IEDriverServer` from
[Selenium website](http://selenium-release.storage.googleapis.com/index.html?path=3.6/)

For Edge download [Microsoft WebDriver](https://developer.microsoft.com/en-us/microsoft-edge/tools/webdriver/)


Start a Selenium Hub:

```
java -jar selenium-server-standalone-3.6.0.jar -role hub
```

Register IE Node (change the location of IEDriverServer.exe according to
your system)

```
java -Dwebdriver.ie.driver=C:\Users\User\Selenium\IEDriverServer.exe -jar selenium-server-standalone-3.6.0.jar -role node -hub http://10.0.2.15:4444/grid/register -browser "browserName=internet explorer,platform=WINDOWS,maxInstances=10"
```

Register Edge Node (change the location of MicrosoftWebDriver.exe according to
your system)

```
java -Dwebdriver.edge.driver=C:\Users\User\Selenium\MicrosoftWebDriver.exe -jar selenium-server-standalone-3.6.0.jar -role node -hub http://10.0.2.15:4444/grid/register -browser "browserName=MicrosoftEdge,platform=WINDOWS,maxInstances=10"
```

Edit the `remote_ci_url` in your project `config.yml` and set it to the
Selenium Hub URL, e.g:

```
remote_ci_url: http://192.168.56.2:4444/wd/hub
```


### Internet Explorer caveats

- If you’re running a 64-bit version of Windows, do not go with the 64-bit IE
  driver for IE 10+. This is the source of incredibly slow typing.

- IE 11 requires a registry key to be set, otherwise connections to the browser
  process will drop out. [Here’s a registry export snippet]() for 64-bit Windows.

- Some systems require moving the Security level from `High` to `Medium`
  in Internet Options -> Security to work correctly.
