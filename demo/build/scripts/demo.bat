@rem
@rem Copyright 2015 the original author or authors.
@rem
@rem Licensed under the Apache License, Version 2.0 (the "License");
@rem you may not use this file except in compliance with the License.
@rem You may obtain a copy of the License at
@rem
@rem      https://www.apache.org/licenses/LICENSE-2.0
@rem
@rem Unless required by applicable law or agreed to in writing, software
@rem distributed under the License is distributed on an "AS IS" BASIS,
@rem WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
@rem See the License for the specific language governing permissions and
@rem limitations under the License.
@rem

@if "%DEBUG%"=="" @echo off
@rem ##########################################################################
@rem
@rem  demo startup script for Windows
@rem
@rem ##########################################################################

@rem Set local scope for the variables with windows NT shell
if "%OS%"=="Windows_NT" setlocal

set DIRNAME=%~dp0
if "%DIRNAME%"=="" set DIRNAME=.
@rem This is normally unused
set APP_BASE_NAME=%~n0
set APP_HOME=%DIRNAME%..

@rem Resolve any "." and ".." in APP_HOME to make it shorter.
for %%i in ("%APP_HOME%") do set APP_HOME=%%~fi

@rem Add default JVM options here. You can also use JAVA_OPTS and DEMO_OPTS to pass JVM options to this script.
set DEFAULT_JVM_OPTS=

@rem Find java.exe
if defined JAVA_HOME goto findJavaFromJavaHome

set JAVA_EXE=java.exe
%JAVA_EXE% -version >NUL 2>&1
if %ERRORLEVEL% equ 0 goto execute

echo.
echo ERROR: JAVA_HOME is not set and no 'java' command could be found in your PATH.
echo.
echo Please set the JAVA_HOME variable in your environment to match the
echo location of your Java installation.

goto fail

:findJavaFromJavaHome
set JAVA_HOME=%JAVA_HOME:"=%
set JAVA_EXE=%JAVA_HOME%/bin/java.exe

if exist "%JAVA_EXE%" goto execute

echo.
echo ERROR: JAVA_HOME is set to an invalid directory: %JAVA_HOME%
echo.
echo Please set the JAVA_HOME variable in your environment to match the
echo location of your Java installation.

goto fail

:execute
@rem Setup the command line

set CLASSPATH=%APP_HOME%\lib\demo-1.0-plain.jar;%APP_HOME%\lib\spring-boot-maven-plugin-2.3.0.RELEASE.jar;%APP_HOME%\lib\spring-boot-devtools-2.7.8.jar;%APP_HOME%\lib\spring-boot-starter-web-2.7.8.jar;%APP_HOME%\lib\tomcat-embed-jasper-9.0.71.jar;%APP_HOME%\lib\jstl-1.2.jar;%APP_HOME%\lib\mybatis-spring-boot-starter-2.2.0.jar;%APP_HOME%\lib\ojdbc8-21.3.0.0.jar;%APP_HOME%\lib\maven-jar-plugin-3.2.0.jar;%APP_HOME%\lib\spring-boot-starter-tomcat-2.7.8.jar;%APP_HOME%\lib\spring-boot-starter-json-2.7.8.jar;%APP_HOME%\lib\spring-boot-starter-jdbc-2.7.8.jar;%APP_HOME%\lib\spring-boot-starter-2.7.8.jar;%APP_HOME%\lib\mybatis-spring-boot-autoconfigure-2.2.0.jar;%APP_HOME%\lib\spring-boot-autoconfigure-2.7.8.jar;%APP_HOME%\lib\spring-boot-2.7.8.jar;%APP_HOME%\lib\spring-webmvc-5.3.25.jar;%APP_HOME%\lib\spring-web-5.3.25.jar;%APP_HOME%\lib\tomcat-embed-websocket-9.0.71.jar;%APP_HOME%\lib\tomcat-embed-core-9.0.71.jar;%APP_HOME%\lib\tomcat-embed-el-9.0.71.jar;%APP_HOME%\lib\ecj-3.26.0.jar;%APP_HOME%\lib\mybatis-3.5.7.jar;%APP_HOME%\lib\mybatis-spring-2.0.6.jar;%APP_HOME%\lib\maven-archiver-3.5.0.jar;%APP_HOME%\lib\maven-common-artifact-filters-3.1.0.jar;%APP_HOME%\lib\file-management-3.0.0.jar;%APP_HOME%\lib\maven-shared-io-3.0.0.jar;%APP_HOME%\lib\maven-compat-3.0.jar;%APP_HOME%\lib\maven-core-3.0.jar;%APP_HOME%\lib\maven-plugin-api-3.6.3.jar;%APP_HOME%\lib\maven-artifact-3.6.3.jar;%APP_HOME%\lib\maven-shared-utils-3.2.1.jar;%APP_HOME%\lib\plexus-archiver-4.2.1.jar;%APP_HOME%\lib\maven-aether-provider-3.0.jar;%APP_HOME%\lib\maven-repository-metadata-3.0.jar;%APP_HOME%\lib\maven-model-builder-3.0.jar;%APP_HOME%\lib\plexus-io-3.2.0.jar;%APP_HOME%\lib\maven-settings-builder-3.6.3.jar;%APP_HOME%\lib\plexus-build-api-0.0.7.jar;%APP_HOME%\lib\plexus-sec-dispatcher-1.4.jar;%APP_HOME%\lib\sisu-inject-plexus-2.6.0.jar;%APP_HOME%\lib\wagon-provider-api-2.10.jar;%APP_HOME%\lib\maven-model-3.6.3.jar;%APP_HOME%\lib\org.eclipse.sisu.plexus-0.3.4.jar;%APP_HOME%\lib\maven-settings-3.6.3.jar;%APP_HOME%\lib\plexus-utils-3.3.0.jar;%APP_HOME%\lib\spring-boot-buildpack-platform-2.7.8.jar;%APP_HOME%\lib\spring-boot-loader-tools-2.7.8.jar;%APP_HOME%\lib\jakarta.annotation-api-1.3.5.jar;%APP_HOME%\lib\spring-context-5.3.25.jar;%APP_HOME%\lib\spring-aop-5.3.25.jar;%APP_HOME%\lib\spring-jdbc-5.3.25.jar;%APP_HOME%\lib\spring-tx-5.3.25.jar;%APP_HOME%\lib\spring-beans-5.3.25.jar;%APP_HOME%\lib\spring-expression-5.3.25.jar;%APP_HOME%\lib\spring-core-5.3.25.jar;%APP_HOME%\lib\spring-boot-starter-logging-2.7.8.jar;%APP_HOME%\lib\snakeyaml-1.30.jar;%APP_HOME%\lib\jackson-datatype-jsr310-2.13.4.jar;%APP_HOME%\lib\jackson-module-parameter-names-2.13.4.jar;%APP_HOME%\lib\jackson-annotations-2.13.4.jar;%APP_HOME%\lib\jackson-core-2.13.4.jar;%APP_HOME%\lib\jackson-datatype-jdk8-2.13.4.jar;%APP_HOME%\lib\jackson-databind-2.13.4.2.jar;%APP_HOME%\lib\tomcat-annotations-api-9.0.71.jar;%APP_HOME%\lib\HikariCP-4.0.3.jar;%APP_HOME%\lib\aether-impl-1.7.jar;%APP_HOME%\lib\aether-util-1.7.jar;%APP_HOME%\lib\aether-spi-1.7.jar;%APP_HOME%\lib\aether-api-1.7.jar;%APP_HOME%\lib\plexus-interpolation-1.25.jar;%APP_HOME%\lib\plexus-classworlds-2.6.0.jar;%APP_HOME%\lib\plexus-component-annotations-1.5.5.jar;%APP_HOME%\lib\commons-io-2.6.jar;%APP_HOME%\lib\commons-compress-1.21.jar;%APP_HOME%\lib\snappy-0.4.jar;%APP_HOME%\lib\xz-1.8.jar;%APP_HOME%\lib\jna-platform-5.7.0.jar;%APP_HOME%\lib\httpclient-4.5.14.jar;%APP_HOME%\lib\tomlj-1.0.0.jar;%APP_HOME%\lib\spring-jcl-5.3.25.jar;%APP_HOME%\lib\logback-classic-1.2.11.jar;%APP_HOME%\lib\log4j-to-slf4j-2.17.2.jar;%APP_HOME%\lib\jul-to-slf4j-1.7.36.jar;%APP_HOME%\lib\slf4j-api-1.7.36.jar;%APP_HOME%\lib\log4j-api-2.17.2.jar;%APP_HOME%\lib\commons-codec-1.15.jar;%APP_HOME%\lib\commons-lang3-3.12.0.jar;%APP_HOME%\lib\httpcore-4.4.16.jar;%APP_HOME%\lib\logback-core-1.2.11.jar;%APP_HOME%\lib\maven-builder-support-3.6.3.jar;%APP_HOME%\lib\sisu-inject-bean-2.6.0.jar;%APP_HOME%\lib\cdi-api-1.0.jar;%APP_HOME%\lib\sisu-guice-3.2.5-no_aop.jar;%APP_HOME%\lib\javax.inject-1.jar;%APP_HOME%\lib\plexus-cipher-1.4.jar;%APP_HOME%\lib\antlr4-runtime-4.7.2.jar;%APP_HOME%\lib\jsr305-3.0.2.jar;%APP_HOME%\lib\jna-5.7.0.jar;%APP_HOME%\lib\org.eclipse.sisu.inject-0.3.4.jar;%APP_HOME%\lib\jsr250-api-1.0.jar;%APP_HOME%\lib\guava-16.0.1.jar


@rem Execute demo
"%JAVA_EXE%" %DEFAULT_JVM_OPTS% %JAVA_OPTS% %DEMO_OPTS%  -classpath "%CLASSPATH%" com.demo.DemoApplication %*

:end
@rem End local scope for the variables with windows NT shell
if %ERRORLEVEL% equ 0 goto mainEnd

:fail
rem Set variable DEMO_EXIT_CONSOLE if you need the _script_ return code instead of
rem the _cmd.exe /c_ return code!
set EXIT_CODE=%ERRORLEVEL%
if %EXIT_CODE% equ 0 set EXIT_CODE=1
if not ""=="%DEMO_EXIT_CONSOLE%" exit %EXIT_CODE%
exit /b %EXIT_CODE%

:mainEnd
if "%OS%"=="Windows_NT" endlocal

:omega
