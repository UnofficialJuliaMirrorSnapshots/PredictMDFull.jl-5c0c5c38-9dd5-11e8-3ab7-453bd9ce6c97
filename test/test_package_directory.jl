##### Beginning of file

Test.@test( isdir(PredictMDFull.package_directory()) )

Test.@test( isdir(PredictMDFull.package_directory("ci")) )

Test.@test( isdir(PredictMDFull.package_directory("ci", "travis")) )

Test.@test( isdir(PredictMDFull.package_directory(TestModuleA)) )

Test.@test( isdir(PredictMDFull.package_directory(TestModuleB)) )

Test.@test( isdir( PredictMDFull.package_directory(
            TestModuleB, "directory2",
            ) ) )

Test.@test( isdir( PredictMDFull.package_directory(
            TestModuleB, "directory2", "directory3",
            ) ) )

Test.@test_throws(
    ErrorException,
    PredictMDFull.package_directory(TestModuleC),
    )

##### End of file
