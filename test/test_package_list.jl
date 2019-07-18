##### Beginning of file

import PredictMDFull

function is_travis_ci(a::AbstractDict = ENV)
    result = ( lowercase(strip(get(a, "CI", ""))) == "true" ) &&
        ( lowercase(strip(get(a, "TRAVIS", ""))) == "true" ) &&
        ( lowercase(strip(get(a, "CONTINUOUS_INTEGRATION", "")) ) == "true")
    return result
end

if is_travis_ci()
    Test.@testset "Testing _print_list_of_package_imports()" begin
        PredictMDFull._print_list_of_package_imports()
    end
end

##### End of file
