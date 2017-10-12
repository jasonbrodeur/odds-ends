cd('/media/Stuff/Downloaded/Camera');
d = dir(pwd);

for i = 3:1:length(d)
  if d(i).isdir==0
  [dir_in, name_in, ext_in] = fileparts(d(i).name);
    if strcmp(ext_in,'.mp4')==1
        to_run = ['ffmpeg -i ' name_in '.mp4 -c:v libx264 -preset veryslow -crf 22 -c:a copy ' name_in '.mkv'];
        STATUS = unix (to_run);
        if STATUS==0
        disp(['Successfully created ' name_in '.mkv']);
        else
        disp(['ERROR creating ' name_in '.mkv']);
        end
    end
  end
end
