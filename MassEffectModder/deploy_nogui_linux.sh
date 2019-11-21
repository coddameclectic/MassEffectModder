build_path=$(cd ../build-MassEffectModderNoGui-*-Release/MassEffectModder; pwd)
cp $build_path/MassEffectModderNoGui .
version=`grep -E "^VERSION" MassEffectModder/Program/Version.pri | grep -o -E "[0-9]+"`
zip MassEffectModderNoGui-Linux-v$version.zip MassEffectModderNoGui -9
rm MassEffectModderNoGui
