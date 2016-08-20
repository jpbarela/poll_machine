$(document).on('turbolinks:load', function(){
  $("input[data-question='1']").blur(function(event){
    inputElement = $(event.target);

    if(inputElement.val() !== ''){
      currentQuestionIndex = parseInt(inputElement.attr("data-question"));
      nextQuestionIndex = currentQuestionIndex + 1;

      newQuestion = inputElement.parent().clone(true);
      currentInputTag = 'input[data-question="'+ currentQuestionIndex + '"]';
      newQuestion.children(currentInputTag).val("");
      newQuestion.children(currentInputTag).attr("data-question", nextQuestionIndex);
      newQuestion.children('label').text("Poll Question " + nextQuestionIndex);

      choiceList = newQuestion.children('ul');

      firstChoice = choiceList.children().first().children('input');
      firstChoice.attr("name", "choices" + nextQuestionIndex + "[][value]");
      firstChoice.attr("data-choice-"+nextQuestionIndex, 1);
      firstChoice.removeAttr('data-choice-'+currentQuestionIndex);

      for(var i = choiceList.length-1; i > 0; i--){
        choiceList[i].remove();
      }

      inputElement.parent().parent().append(newQuestion);
    }
  });
});
