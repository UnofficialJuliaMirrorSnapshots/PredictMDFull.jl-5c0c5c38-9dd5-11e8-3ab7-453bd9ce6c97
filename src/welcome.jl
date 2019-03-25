##### Beginning of file

function _print_welcome_message()::Nothing
    predictmdfull_version::VersionNumber = version()
    predictmdfull_pkgdir::String = package_directory()
    @info(string("This is PredictMDFull, version ",predictmdfull_version,),)
    @info(string("For help, please visit https://predictmd.net",),)
    @debug(string("PredictMDFull package directory: ",predictmdfull_pkgdir,),)
    return nothing
end

##### End of file
