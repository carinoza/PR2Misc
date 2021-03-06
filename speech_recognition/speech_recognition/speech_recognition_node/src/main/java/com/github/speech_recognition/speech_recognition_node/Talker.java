/*
 * Copyright (C) 2014 Tomas.
 * 
 * Licensed under the Apache License, Version 2.0 (the "License"); you may not
 * use this file except in compliance with the License. You may obtain a copy of
 * the License at
 * 
 * http://www.apache.org/licenses/LICENSE-2.0
 * 
 * Unless required by applicable law or agreed to in writing, software
 * distributed under the License is distributed on an "AS IS" BASIS, WITHOUT
 * WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied. See the
 * License for the specific language governing permissions and limitations under
 * the License.
 */

package com.github.rosjava.speech_recognition.speech_recognition_node;

import edu.cmu.sphinx.api.Configuration;
import edu.cmu.sphinx.api.LiveSpeechRecognizer;
import edu.cmu.sphinx.api.SpeechResult;
import org.ros.concurrent.CancellableLoop;
import org.ros.namespace.GraphName;
import org.ros.node.AbstractNodeMain;
import org.ros.node.ConnectedNode;
import org.ros.node.NodeMain;
import org.ros.node.topic.Publisher;

import java.io.IOException;

/**
 * A simple {@link Publisher} {@link NodeMain}.
 */
public class Talker extends AbstractNodeMain {

    LiveSpeechRecognizer recognizer;

  @Override
  public GraphName getDefaultNodeName() {
    return GraphName.of("rosjava/talker");
  }

  @Override
  public void onStart(final ConnectedNode connectedNode) {
    final Publisher<std_msgs.String> publisher =
        connectedNode.newPublisher("sphinx_speech_recon", std_msgs.String._TYPE);

    // This CancellableLoop will be canceled automatically when the node shuts
    // down.
    connectedNode.executeCancellableLoop(new CancellableLoop() {

        @Override
      protected void setup() {
          Configuration configuration = new Configuration();

          configuration.setAcousticModelPath("resource:/edu/cmu/sphinx/models/en-us/en-us");
          configuration
                  .setDictionaryPath("resource:/edu/cmu/sphinx/models/en-us/cmudict-en-us.dict");
          configuration
                  .setLanguageModelPath("resource:/edu/cmu/sphinx/models/en-us/en-us.lm.bin");

          try {
              recognizer = new LiveSpeechRecognizer(configuration);
          } catch (IOException e) {
              e.printStackTrace();
          }
      }

      @Override
      protected void loop() throws InterruptedException {
          recognizer.startRecognition(true);
          SpeechResult result;
          result = recognizer.getResult();

          std_msgs.String str = publisher.newMessage();
          str.setData(result.getHypothesis());
        publisher.publish(str);
          recognizer.stopRecognition();

          Thread.sleep(1000);
      }
    });
  }
}
