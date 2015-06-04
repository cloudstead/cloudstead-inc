A Cloudstead Glossary
=====================

#### appstore-server
Java webapp that runs the Cloudstead App Store.

#### app
A CloudOs application. In source form it is a cloudos-manifest.json file and (optionally) supporting files. 
In bundled form it is a gzipped tar archive (aka a bundle).

#### artifact
A deployable piece of code. Each of the java webapps is a deployable artifact, as is each of the CloudOs apps.

#### bundle
An artifact that represents a CloudOs app. Create bundles with the CloudOs Bundler (cbundle_app or cbundler)

#### cbundle_app
A script that will bundle up one CloudOs app. The resulting bundle file will be written to app-dir/target/appname-bundle.tar.gz

#### cbundler
A script that bundles up every CloudOs app found within a directory hierarchy.

#### cloudos-server
Java webapp that runs on each cloudstead instance. It is responsible for overall management of the cloudstead and its apps.

#### cloudstead-server
Java webapp that runs the "launcher" app, allowing people to launch new cloudsteads. This is the primary webapp that runs
on cloudstead.io

#### dns-server
Java webapp that runs the cloudos-dns service. A dns-server can be configured to manage an external Dyn account, or a local djbdns (aka tinydns) server.
The cloudos-server requires a dns-server to manage its DNS. Cloudsteads launched from cloudstead.io will be given credentials to use the dns-server running on cloudstead.io.
Cloudsteads launched individually, a dns-server will be installed alongside the cloudos-server, and it is up to the cloudstead owner to decide
whether to connect that dns-server to a Dyn account or a local djbdns server.

#### manifest
A cloudos-manifest.json file. Defines a CloudOs app.

#### prep.sh
The script that prepares and deploys artifacts.