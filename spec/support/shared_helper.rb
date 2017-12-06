module SharedHelper
  extend self

  def png_file
    File.open('./spec/support/1px.png')
  end

  def resp1
    <<-HERE
      <div class="contenerImgWeather">
        <div class="helpImg60"><img src="http://m.meteo.pl/img/leg60.png" /></div>
        <img src="https://www.meteo.pl/um/metco/mgram_pict.php?ntype=0u&fdate=2017092106&row=406&col=250&lang=pl" class="border" id="image_60" alt="miasto" />
      </div>
    HERE
  end
end
