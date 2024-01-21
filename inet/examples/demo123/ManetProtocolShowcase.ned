//
// This program is free software: you can redistribute it and/or modify
// it under the terms of the GNU Lesser General Public License as published by
// the Free Software Foundation, either version 3 of the License, or
// (at your option) any later version.
// 
// This program is distributed in the hope that it will be useful,
// but WITHOUT ANY WARRANTY; without even the implied warranty of
// MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
// GNU Lesser General Public License for more details.
// 
// You should have received a copy of the GNU Lesser General Public License
// along with this program.  If not, see http://www.gnu.org/licenses/.
// 

package inet.examples.demo123;
import inet.networklayer.configurator.ipv4.Ipv4NetworkConfigurator;
import inet.node.inet.ManetRouter;
import inet.physicallayer.wireless.ieee80211.packetlevel.Ieee80211ScalarRadioMedium;
import inet.visualizer.common.IntegratedMultiVisualizer;

network ManetprotocolsShowcaseB
{
    parameters:
        @display("bgb=618,552");
        @statistic[numSentPk](source=count(source.app[0].pingTxSeq); record=figure; targetFigure=numSentPkCounter; checkSignals=false);
        @figure[numSentPkCounter](type=counter; transform=scale(0.5); pos=50,200; label="Sent pings"; decimalPlaces=4);
        @statistic[numRcvdPk](source=count(source.app[0].pingRxSeq); record=figure; targetFigure=numRcvdPkCounter; checkSignals=false);
        @figure[numRcvdPkCounter](type=counter; transform=scale(0.5); pos=50,300; label="Received ping replies"; decimalPlaces=4);
        @statistic[numLost](source=count(source.app[0].numLost); record=figure; targetFigure=numLostPkCounter; checkSignals=false);
        @figure[numLostPkCounter](type=counter; transform=scale(0.5); pos=50,400; label="Pings lost"; decimalPlaces=4);

    submodules:
        source: ManetRouter {
            @display("p=77,306");
        }
        node2: ManetRouter {
            @display("p=213,414");
        }
        destination: ManetRouter {
            @display("p=490,306");
        }
        radioMedium: Ieee80211ScalarRadioMedium {
            @display("p=38,28");
        }
        configurator: Ipv4NetworkConfigurator {
            @display("p=160,32");
        }
        visualizer: IntegratedMultiVisualizer {
            @display("p=107,32");
        }
        manetRouter: ManetRouter {
            @display("p=221,194");
        }
        manetRouter1: ManetRouter {
            @display("p=213,306");
        }
        manetRouter4: ManetRouter {
            @display("p=364,306");
        }
}
