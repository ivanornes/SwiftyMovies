import Foundation
import ApolloCodegenLib

let parentFolderOfScriptFile = FileFinder.findParentFolder()
let sourceRootURL = parentFolderOfScriptFile
  .apollo.parentFolderURL() // Result: Sources folder
  .apollo.parentFolderURL() // Result: Codegen folder
  .apollo.parentFolderURL() // Result: MyProject source root folder

let cliFolderURL = sourceRootURL
  .apollo.childFolderURL(folderName: "Codegen")
  .apollo.childFolderURL(folderName: "ApolloCLI")

let endpoint = URL(string: "https://tmdb.apps.quintero.io")!

let output = sourceRootURL
    .apollo.childFolderURL(folderName:"SwiftyMovies")

try FileManager
  .default
  .apollo.createFolderIfNeeded(at: output)

let schemaDownloadOptions = ApolloSchemaOptions(endpointURL: endpoint,
                                                outputFolderURL: output)
do {
  try ApolloSchemaDownloader.run(with: cliFolderURL,
                                 options: schemaDownloadOptions)
} catch {
  exit(1)
}

let targetURL = sourceRootURL
    .apollo.childFolderURL(folderName: "SwiftyMovies")

try FileManager
      .default
      .apollo.createFolderIfNeeded(at: targetURL)

let codegenOptions = ApolloCodegenOptions(targetRootURL: targetURL)

do {
    try ApolloCodegen.run(from: targetURL,
                          with: cliFolderURL,
                          options: codegenOptions)
} catch {
    exit(1)
}
