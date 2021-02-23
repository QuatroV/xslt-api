class IndexController < ApplicationController
    def index
        data = params[:num].to_f
        x = []
        x[0] = data
        i = 1
        while (x[i-1]**2-data)/data > 0.001
            x[i] = 0.5*(x[i-1]+data/x[i-1])
            i += 1
        end
        respond_to do |format|
            format.xml { render xml: x.to_xml }
            format.rss { render xml: x.to_xml }
        end
    end
end
