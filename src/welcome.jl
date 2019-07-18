##### Beginning of file

function _print_welcome_message(a::AbstractDict = ENV)::Nothing
    predictmdfull_version::VersionNumber = version()
    predictmdfull_pkgdir::String = package_directory()
    if !_suppress_welcome_message(a)
        @info(string("This is PredictMDFull, version ",predictmdfull_version,),)
        @info(string("For help, please visit https://predictmd.net",),)
        @debug(string("PredictMDFull package directory: ",predictmdfull_pkgdir,),)
    end
    return nothing
end

function _suppress_welcome_message(a::AbstractDict = ENV)::Bool
    return get(a, "SUPPRESS_PREDICTMDFULL_WELCOME_MESSAGE", "false") == "true"
end

##### End of file
